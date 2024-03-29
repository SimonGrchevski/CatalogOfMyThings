require 'date'

class Item
  attr_reader :id, :publish_date, :archived, :label, :author, :genre

  def initialize(args)
    @id = Random.rand(1..1_000)
    @publish_date = args[:publish_date]
    @archived = args[:archived]
    @items = []
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - Date.parse(@publish_date).year) > 10
  end
end
