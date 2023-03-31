require_relative './items'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(last_played_at, publish_date, multiplayer: true)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current_year = Date.today.year
    current_last_played_year = Date.parse(@last_played_at).year
    super && current_year - current_last_played_year > 2
  end
end
