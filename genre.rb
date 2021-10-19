class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name:)
    id = rand(1..100)
    @name = name
    @items = []
  end
end
