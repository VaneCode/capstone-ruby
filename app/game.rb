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

  def self.add_game(games)
    print 'Please enter the name of the game'
    name = gets.chomp
    print 'Enter the published date:'
    publish_date = gets.chomp
    print 'Enter if is multiplayed'
    multiplayer = gets.chomp
    print 'Enter the when last played'
    last_played_at = gets.chomp
    game = Game.new(name: name, publish_date, multiplayer, last_played_at)
    # 
    games << game
    
  end

  def self.list_all_games(games)
    if games.empty?
      puts "You don't have games"
    else
      games.each do |_game|
        puts "name: \"#{games.name}\" publish_date: #{games.publish_date}
          mutiplayer: #{games.multiplayer} last_played_at: #{games.last_played_at}"
      end
    end
  end

  private

  def can_be_archived?
    super && Date.today - Date.parse(@last_played) > 2 * 365
  end
end
game = Game.new(name: 'Solatire', publish_date: '2022/10/9', multiplayer: true, last_played_at: '2018/10/10')
puts game.publish_date
