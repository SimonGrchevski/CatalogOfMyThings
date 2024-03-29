require_relative 'game'
require_relative 'module/screen'

class Displayer
  def initialize(args)
    @games = args[:games]
    @authors = args[:authors]
    @books = args[:books]
    @labels = args[:labels]
    @music_albums = args[:music_albums]
    @genres = args[:genres]
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

  def list_all_books
    puts "Books: \n\n"
    @books.map do |book|
      print "[#{book.class}] "
      print "By #{book.author.first_name} #{book.author.last_name}. "
      print "Published on: #{book.publish_date} "
      print book.archived ? 'Archived.' : 'Not Archived.'
      print "The publisher is: #{book.publisher} and "
      print "The cover is in #{book.cover_state} state"
      print "\n\n"
    end
  end

  def list_all_labels
    puts "Labels: \n\n"
    @labels.each_with_index do |l, i|
      print "#{i}) Title: #{l.title} Color: #{l.color}\n"
    end
    print "\n\n"
  end

  def list_all_music_albums
    puts "Music Albums: \n ****"
    @music_albums.map do |album|
      puts "[#{album.class}] "
      puts "By #{album.author.first_name} #{album.author.last_name}. "
      puts "Published on: #{album.publish_date} "
      puts album.archived ? 'Archived.' : 'Not Archived.'
      puts album.on_spotify ? 'Album is on Spotify.' : 'Album is NOT on Spotify.'
      print "\n\n"
    end
  end

  def list_all_genres
    puts "Genres: \n\n"
    @genres.each_with_index do |g, i|
      print "#{i}) #{g.name} \n"
    end
    print "\n\n"
  end
end
