require 'date'
require_relative 'item'

class Game < Item
  
end
game = Game.new(name: 'Solatire', publish_date: '2022/10/9', multiplayer: true, last_played_at: '2018/10/10')
puts game.publish_date
