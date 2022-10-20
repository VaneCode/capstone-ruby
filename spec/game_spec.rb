require 'date'
require './app/game'

describe Game do
  before :each do
    @game = Game.new(publish_date: '09/10/2022', multiplayer: true, last_played_at: '09/10/2022')
  end

  it 'Should be instance of game' do
    expect(@game).to be_an_instance_of Game
  end

  it 'Should be multiplayer true' do
    expect(@game.multiplayer).to eq true
  end

  it 'Method getter for publish_date should return 09/10/2022' do
    expect(@game.publish_date).to eq '09/10/2022'
  end

  it 'Method getter for last_played_at should return 09/10/2022' do
    expect(@game.last_played_at).to eq '09/10/2022'
  end

  it 'items should return correct value for move_to_archive' do
    @game.move_to_archive
    expect(@game.archived).to eq false
  end
end
