require_relative 'author'
require_relative 'game'
require_relative 'item'
require 'json'

class Storage
  def stringify(args)
    File.open('games.json', 'w') { |f| f.write JSON.generate(args[:games]) }
    File.open('authors.json', 'w') { |f| f.write JSON.generate(args[:authors]) }
  end

  def parse
    {
      authors: parse_authors,
      games: parse_games
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
        archieved: game['archieved']
      }
      author = parse_authors.detect { |a| a.id.eql?(game['author']['id']) }
      item = Game.new(game['multiplayer'], game['last_played_at'], params)
      item.add_author author
      item
    end
  end
end
