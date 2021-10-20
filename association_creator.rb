require_relative 'module/screen'
require_relative 'author'
require_relative 'label'

class AssociationCreator
  include Screen
  def initialize(args)
    @authors = args[:authors]
    @labels = args[:labels]
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

  def add_label(item)
    puts 'Choose an label from the list below or "n" to create one: '
    @labels.each_index do |i|
      puts "(#{i}) Title: #{@labels[i].title}. Color: #{@labels[i].color}"
    end
    label = nil
    key = user_input
    if key.eql?('n')
      print 'Title: '
      title = user_input
      print 'Color: '
      color = user_input
      label = Label.new(title, color)
      @labels << label
    else
      label = @labels[key.to_i]
    end
    item.add_label label
  end
end
