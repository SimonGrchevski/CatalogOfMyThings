require_relative 'association_creator'
require_relative 'game'
require_relative 'module/screen'
require_relative 'module/helper'

class Creator
  include Screen
  include Helper
  def initialize(args)
    @association = AssociationCreator.new(args)
    @games = args[:games]
    @books = args[:books]
    @music_albums = args[:music_albums]
  end

  def create_game
    print 'Is it Multiplayer? [Y/N]: '
    multi_player = user_input == 'n'
    print 'Last Played At (yyyy/mm/dd): '
    last_played_at = user_input
    game = Game.new(!multi_player, format_date(last_played_at), { publish_date: publish_date, archived: !archived })
    @games << game
    create_associations(game)
    puts 'Game created successfully'
  end

  def create_book
    puts 'Insert the publisher of the book (oreilly): '
    publisher = user_input
    puts 'Whats the cover state of the book: (good or bad): '
    cover_state = user_input
    book = Book.new(publisher, cover_state, { publish_date: publish_date, archived: !archived })
    @books << book
    create_associations(book)
    puts 'Book created successfully'
  end

  def create_music_album
    on_spotify = nil
    print 'Is the album on Spotify? [Y/N]: '
    on_spotify = user_input
    until %w[y Y n N].any? { |answer| answer == on_spotify }
      puts 'try again'
      on_spotify = user_input
    end
    music_album = MusicAlbum.new(on_spotify, { publish_date: publish_date, archived: !archived })
    @music_albums.push(music_album)
    create_associations(music_album)
    puts 'Music Album was created successfully! '
  end

  def publish_date
    print 'Publish date (yyyy/mm/dd): '
    format_date(user_input)
  end

  def archived
    print 'Archived? [Y/N]: '
    user_input == 'n'
  end

  private

  def create_associations(item)
    @association.add_author item
    @association.add_label item
    @association.add_genre item
  end
end
