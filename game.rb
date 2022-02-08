require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :cover_state
  attr_reader :last_played_at

  def initialize(multiplayer, cover_state, last_played_at)
    super(last_played_at)
    @multiplayer = multiplayer
    @cover_state = cover_state
    @last_played_at = last_played_at
  end

  def game_info
    "\n multiplayer : '#{@multiplayer}'
        \n last_played_at : #{@last_played_at}
        "
  end

  def can_be_archived?
    @cover_state > 2 || super
  end
end
