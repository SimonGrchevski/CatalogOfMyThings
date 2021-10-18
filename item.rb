require 'date'

class Item
  attr_reader :id, :publish_date, :archieved

  def initialize(id, publish_date, archieved)
    @id = id
    @publish_date = publish_date
    @archieved = archieved
  end

  def genre(genre)
    @genre = genre
    @genre.items self
  end

  def author(author)
    @author = author
    @author.items self
  end

  def label(label)
    @label = label
    @label.items self
  end

  def move_to_archive
    @archieved = can_be_archived?
  end

  private

  def can_be_archived?
    years_elapsed = Time.now.year - Date.parse('2020-10-18').year
    years_elapsed > 10
  end
end
