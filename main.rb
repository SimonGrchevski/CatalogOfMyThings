def print_options
  op = ['Hello to our app. Here is the options','List all books','List all music albums','List all movies','List all games','List all genres','List all labels','List all authors','Add a book','Add a music album','Add a movie','Add a game','Exit']
  op.each_with_index do |o,i|
    puts "#{i+1}) #{o}"
  end
end


def main
  loop do
    print_options
    inp = gets.chomp.to_i
    case inp
    when 1..8 then puts 'Listing'
    when 9..12 then puts 'Adding'
    when 13 
      'Exit'
      return
    end
  end
  