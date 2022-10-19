require 'json'

module SaveGame
    def save_game(games)
        save_game = []
        games.each do |game|
          save_game << { 'name:' => games.name, 'publish_date:' => games.publish_date
          'mutiplayer:' => games.multiplayer  'last_played_at: ' => games.last_played_at }
        end
        File.write('./data/games.json', JSON.generate(save_game))
    end


     

end