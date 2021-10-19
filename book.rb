require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, args)
    super(args)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || (@cover_state.eql? 'bad')
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'label' => @label,
      'author' => @author,
      'genre' => @genre,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
