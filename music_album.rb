require_relative './item'

class MusicAlbum < Item
  def initialize(genre:, label:, author:, publish_date:, archieved:, on_spotify:)
    super(genre: genre, label: label, author: author, publish_date: publish_date, archieved: archieved)

    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
