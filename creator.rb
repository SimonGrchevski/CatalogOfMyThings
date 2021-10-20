require_relative 'association_creator'
require_relative 'game'
require_relative 'module/screen'

class Creator
  include Screen
  def initialize(args)
    @association = AssociationCreator.new(args)
    @games = args[:games]
    @books = args[:books]
    @music_albums = args[:music_albums]
  end

  def create_game
    print 'Is it Multiplayer? [Y/N]: '
    multi_player = user_input == 'n'
    print 'Last Played At (yyyy-mm-dd): '
    last_played_at = user_input
    game = Game.new(!multi_player, last_played_at, { publish_date: publish_date, archived: !archived })
    @games << game
    @association.add_author game
    @association.add_label game
    @association.add_genre game
    puts 'Game created successfully'
  end

  def create_book
    puts 'Insert the publisher of the book'
    publisher = user_input
    puts 'Whats the cover state of the book'
    cover_state = user_input
    book = Book.new(publisher, cover_state, { publish_date: publish_date, archived: !archived })
    @books << book
    @association.add_author book
    @association.add_label book
    @association.add_genre book
    puts 'Book created successfully'
  end

  def create_music_album
    on_spotify = nil
    print 'Is the album on Spotify? [Y/N]'
    on_spotify = user_input
    until %w[y Y n N].any? { |answer| answer == on_spotify }
      puts 'try again'
      on_spotify = user_input
    end
    music_album = MusicAlbum.new(on_spotify, { publish_date: publish_date, archived: !archived })
    @music_albums.push(music_album)
    @association.add_author music_album
    @association.add_label music_album
    @association.add_genre music_album
    puts 'Music Album was created successfully! '
    pp music_album
  end

  def publish_date
    print 'Publish date: '
    user_input
  end

  def archived
    print 'Archived? [Y/N]: '
    user_input == 'n'
  end
end
