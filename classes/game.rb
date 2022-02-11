require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :name, :last_played_at
  attr_reader :publish_date

  def initialize(multiplayer, name, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @name = name
    @last_played_at = last_played_at
  end

  def can_be_archived?
    recent_year = Time.new.year
    year_last_played = @last_played_at.year
    archive = recent_year - year_last_played
    archive > 2
  end
end
