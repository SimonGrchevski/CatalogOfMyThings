class Label
  attr_reader :title, :color, :items

  def initialize(title,color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items.push item 
    item.add_label self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end

end