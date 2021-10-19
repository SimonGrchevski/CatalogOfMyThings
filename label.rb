class Label
  attr_reader :title, :color, :items
  attr_accessor :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push item
    item.add_label self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color,
      'id' => @id
    }.to_json(*args)
  end
end
