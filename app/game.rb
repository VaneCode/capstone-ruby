require 'date'
require_relative 'item'
require_relative 'author'
require_relative 'validation'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(publish_date:, multiplayer:, last_played_at:)
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.add_game(games)
    puts "Please enter the game's data"
    print 'Publishing date [DD/MM/YYYY]:'
    publish_date = gets.chomp
    multiplayer = Validation.valid_yes_no('Multiplayer [Y/N]: ')
    print 'Last played date [DD/MM/YYYY]:'
    last_played_at = gets.chomp
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer == 'Y', last_played_at: last_played_at)
    author = Author.add_author
    author.add_item(game)
    games << game
    puts 'Your game has been successfully created.'
  end

  def self.list_games(games)
    if games.empty?
      puts "You don't have games at the moment."
    else
      games.each_with_index do |game, idx|
        multi = game.multiplayer ? 'yes' : 'no'
        author = "#{game.author.first_name} #{game.author.last_name}"
        puts "#{idx + 1}) Game's author: #{author}, mutiplayer: #{multi}, publishig date: #{game.publish_date}, last played at: #{game.last_played_at}."
      end
    end
  end

  private

  def can_be_archived?
    super && Date.today - Date.parse(@last_played) > 2 * 365
  end
end
