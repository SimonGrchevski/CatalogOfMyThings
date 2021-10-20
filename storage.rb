require_relative 'author'
require_relative 'game'
require_relative 'item'
require_relative 'book'
require_relative 'label'

require_relative 'music_album'
require_relative 'genre'

require 'json'

class Storage
  def stringify(args)
    File.open('games.json', 'w') { |f| f.write JSON.generate(args[:games]) }
    File.open('authors.json', 'w') { |f| f.write JSON.generate(args[:authors]) }

    File.open('books.json', 'w') { |f| f.write JSON.generate(args[:books]) }
    File.open('labels.json', 'w') { |f| f.write JSON.generate(args[:labels]) }

    File.open('music_albums.json', 'w') { |f| f.write JSON.generate(args[:music_albums]) }
    File.open('genres.json', 'w') { |f| f.write JSON.generate(args[:genres]) }
  end

  def parse
    {
      authors: parse_authors,
      games: parse_games,
      books: parse_books,
      labels: parse_labels,
      music_albums: parse_music_albums,
      genres: parse_genres
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
      label = parse_labels.detect { |l| l.id.eql?(game['label']['id']) }
      genre = parse_genres.detect { |g| g.id.eql?(game['genre']['id']) }

      item = Game.new(game['multiplayer'], game['last_played_at'], params)
      item.add_author author
      item.add_label label
      item.add_genre genre
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
      label = parse_labels.detect { |l| l.id.eql?(book['label']['id']) }
      genre = parse_genres.detect { |g| g.id.eql?(book['genre']['id']) }
      book = Book.new(book['publisher'], book['cover_state'], params)
      book.add_author author
      book.add_label label
      book.add_genre genre
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

  def parse_music_albums
    file_name = 'music_albums.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |item|
      params = {
        publish_date: item['publish_date'],
        archieved: item['archived']
      }
      author = parse_authors.detect { |a| a.id.eql?(item['author']['id']) }
      label = parse_labels.detect { |l| l.id.eql?(item['label']['id']) }
      genre = parse_genres.detect { |g| g.id.eql?(item['genre']['id']) }
      music_album = MusicAlbum.new(item['on_spotify'], params)
      music_album.add_author author
      music_album.add_label label
      music_album.add_genre genre
      music_album
    end
  end

  def parse_genres
    file_name = 'genres.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |g|
      genre = Genre.new(g['name'])
      genre.id = g['id']
      genre
    end
  end
end
