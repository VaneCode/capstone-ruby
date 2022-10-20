require 'date'
require './app/game'

describe Game do
  before :each do
    @game = Game.new( publish_date: '09/10/2022', multiplayer: true, last_played_at: '09/10/2022')
  end

  context 'Game class tests' do
    it 'should be instance of game' do
      expect(@game).to be_an_instance_of Game
    end

    it 'should be multiplayer true' do
      expect(@game.multiplayer).to eq true
    end
  end

  it 'items should return correct value for move_to_archive' do
    @game.move_to_archive
    expect(@game.archived).to eq false
  end
end
