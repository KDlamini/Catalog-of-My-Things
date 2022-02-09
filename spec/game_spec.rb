require_relative '../game'
require 'date'

describe Game do
  context 'Game class Test' do
    multiplayer = true
    name = 'fifa'
    last_played_at = Date.parse('22-02-22')
    
    game = Game.new(multiplayer, name, last_played_at)

    it 'is an instance of class item' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'has multiplayer as true' do
      expect(game.multiplayer).to eq(true)
    end

    it 'checks can_be_archived as false' do
      expect(game.can_be_archived?).to eq(false)
    end

    new_last_played_at = Date.parse('19-01-22')
    new_name = 'fortnite'
    new_game = Game.new(multiplayer, new_name, new_last_played_at)

    it 'checks can_be_archived as true' do
      expect(new_game.can_be_archived?).to eq(true)
    end
  end
end