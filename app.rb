require_relative 'creator'
require_relative 'displayer'
require_relative 'module/screen'
require_relative 'storage'

class App
  include Screen
  def initialize
    @storage = Storage.new
    @hash = {
      games: @storage.parse[:games],
      authors: @storage.parse[:authors],
      books: @storage.parse[:books],
      labels: @storage.parse[:labels]
    }
    @creator = Creator.new(@hash)
    @displayer = Displayer.new(@hash)
  end

  def print_options
    op = [
      'List all items',
      'List all genres',
      'List all labels',
      'List all authors (e.g. "Stephen King")',
      'Add items',
      'Exit'
    ]
    op.each_with_index do |o, i|
      puts "#{i + 1}) #{o}"
    end
  end

  def add_options
    key = 0
    until (1..3).to_a.include?(key)
      print 'Do you want to add a book (1) or a music album (2) or a game (3)? [Input the number]: '
      key = user_input.to_i
    end
    case key
    when 1
      puts @creator.create_book
    when 2
      puts 'Add a music album'
    when 3
      puts @creator.create_game
    end
  end

  def list_options
    key = 0
    until (1..3).to_a.include?(key)
      puts 'Choose between 1 and 3'
      puts '1 - List all books'
      puts '2 - List all music albums'
      puts '3 - List all games'
      key = user_input.to_i
    end
    case key
    when 1 then @displayer.list_all_books
    when 2
      puts 'List all albums'
    when 3 then @displayer.list_all_games
    end
  end

  def execute
    loop do
      puts 'Hello to our app. Here is the options'
      print_options
      inp = gets.chomp.to_i
      case inp
      when 1 then list_options
      when 3 then @displayer.list_all_labels
      when 4 then @displayer.list_all_authors
      when 5 then add_options
      when 6
        @storage.stringify(@hash)
        return
      end
    end
  end
end
