require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name 

  def initialize(on_spotify, id:nil,publish_date)
    super(id publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end
end