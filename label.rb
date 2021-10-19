class Label
  attr_reader :title, :color

  def initialize(title,color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items.push item 
    item.add_label self
  end

end