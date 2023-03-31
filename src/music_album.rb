require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_soundcloud

  def initialize(publish_date, on_soundcloud: true)
    super(publish_date)
    @on_soundcloud = on_soundcloud
  end

  private

  def can_be_archived?
    super && @on_soundcloud
  end
end
