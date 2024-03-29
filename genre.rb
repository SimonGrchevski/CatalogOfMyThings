class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name:)
    @id = rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end
end
