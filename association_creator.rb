require_relative 'module/screen'
require_relative 'author'

class AssociationCreator
  include Screen
  def initialize(args)
    @authors = args[:authors]
  end

  def add_author(item)
    puts 'Choose an author from the list below or "n" to create one: '
    @authors.each_index do |idx|
      puts "(#{idx}) First name: #{@authors[idx].first_name} Last name: #{@authors[idx].last_name}"
    end
    author = nil
    key = user_input
    if key.eql?('n')
      print 'First name: '
      first_name = user_input
      print 'Last name: '
      last_name = user_input
      author = Author.new(first_name, last_name)
      @authors << author
    else
      author = @authors[key.to_i]
    end
    item.add_author author
  end
end
