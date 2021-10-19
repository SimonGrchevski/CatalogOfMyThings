require_relative 'association_creator'
require_relative 'game'
require_relative 'module/screen'

class Creator
  include Screen
  def initialize(args)
    @association = AssociationCreator.new(args)
    @games = args[:games]
    @books = args[:books]
  end

  def create_game
    print 'Is it Multiplayer? [Y/N]: '
    multi_player = user_input == 'n'
    print 'Last Played At (yyyy-mm-dd): '
    last_played_at = user_input
    game = Game.new(!multi_player, last_played_at, { publish_date: publish_date, archived: !archived })
    @games << game
    @association.add_author game
    puts 'Game created successfully'
  end

  def create_book
    puts 'Insert the publisher of the book'
    publisher = user_input
    puts 'Whats the coverstate of the book'
    cover_state = user_input
    book = Book.new(publisher,cover_state, {publish_date: publish_date, archived: !archived })
    @books << book
    @association.add_author book
    'Book created successfully'
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
