require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at
  attr_reader :id

  def initialize(name:, publish_date:, multiplayer:, last_played_at:)
    super(publish_date: publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  
end
game = Game.new(name: 'Solatire', publish_date: '2022/10/9', multiplayer: true, last_played_at: '2018/10/10')
puts game.publish_date
