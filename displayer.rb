require_relative 'game'
require_relative 'module/screen'

class Displayer
  def initialize(args)
    @games = args[:games]
    @authors = args[:authors]
  end

  def list_all_games
    puts "Games: \n\n"
    @games.map do |game|
      print "[#{game.class}] "
      print "By #{game.author.first_name} "
      print "Published on: #{game.publish_date} "
      print "Archived: #{game.archived}, "
      print "It is a multiplayer: #{game.multiplayer} and was "
      print "Last Played on: #{game.last_played_at}"
      print "\n\n"
    end
  end

  def list_all_authors
    puts 'Authors:'
    print "\n\n"
    @authors.each_index do |idx|
      print "(#{idx}) First name: #{@authors[idx].first_name} Last name: #{@authors[idx].last_name}"
      print "\n\n"
    end
  end
end
