class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name:)
    id = rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
