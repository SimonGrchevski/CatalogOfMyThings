require_relative 'author'
require_relative 'game'
require_relative 'item'
require_relative 'book'
require_relative 'label'
require 'json'

class Storage
  def stringify(args)
    File.open('games.json', 'w') { |f| f.write JSON.generate(args[:games]) }
    File.open('authors.json', 'w') { |f| f.write JSON.generate(args[:authors]) }
    File.open('books.json','w') {|f| f.write JSON.generate(args[:books]) }
    File.open('labels.json','w') {|f| f.write JSON.generate(args[:labels]) }
  end

  def parse
    {
      authors: parse_authors,
      games: parse_games,
      books: parse_books,
      labels: parse_labels
    }
  end

  def parse_authors
    file_name = 'authors.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |a|
      author = Author.new(a['first_name'], a['last_name'])
      author.id = a['id']
      author
    end
  end

  def parse_games
    file_name = 'games.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |game|
      params = {
        publish_date: game['publish_date'],
        archieved: game['archived']
      }
      author = parse_authors.detect { |a| a.id.eql?(game['author']['id']) }
      label = parse_labels.detect { |l| l.id.eql?(game['label']['id'])}
      item = Game.new(game['multiplayer'], game['last_played_at'], params)
      item.add_author author
      item.add_label author
      item
    end
  end

  def parse_books
    file_name = 'books.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |book|
      params = {
        publish_date: book['publish_date'],
        archieved: book['archived']
      }
      author = parse_authors.detect { |a| a.id.eql?(book['author']['id']) }
      label = parse_labels.detect { |l| l.id.eql?(book['label']['id'])}
      book = Book.new(book['publisher'], book['cover_state'], params)
      book.add_author author
      book.add_label label
      book
    end
  end

  def parse_labels
    file_name = 'labels.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |l|
      label = Label.new(l['title'], l['color'])
      label.id = l['id']
      label
    end
  end

end
