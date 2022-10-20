require 'json'
require_relative 'game'
require_relative 'author'

class SaveGameData
  DATA_DIRECTORY = './data_json/'.freeze

  def self.author_to_object(author)
    Author.new(author['first_name'], author['last_name'], author['id'])
  end

  def self.author_to_json(author)
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end

  def self.game_to_object(game)
    author = author_to_object(game['author'])
    game = Game.new(id: game['id'],
                    publish_date: game['publish_date'],
                    last_played_at: game['last_played_at'],
                    multiplayer: game['multiplayer'])
    game.add_author(author)
    game
  end

  def self.game_to_json(game)
    {
      id: game.id,
      publish_date: game.publish_date,
      last_played_at: game.last_played_at,
      multiplayer: game.multiplayer,
      archived: game.archived,
      author: author_to_json(game.author)
    }
  end

  # Read games
  def self.read_games(games)
    path = "#{DATA_DIRECTORY}games.json"
    return unless File.exist?(path)

    games_file = File.open(path)
    JSON.parse(games_file.read).each do |game|
      games << game_to_object(game)
    end
  end

  # Write games
  def self.write_games(games)
    return if games.empty?

    path_file = "#{DATA_DIRECTORY}games.json"
    data_games = games.map do |game|
      game_to_json(game)
    end
    File.write(path_file, JSON.pretty_generate(data_games))
  end
end
