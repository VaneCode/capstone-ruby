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

    def save_authors
        author_save = []
   @authors.each do |author|
       author << {
           first_name: author.first_name,
           last_name: author.last_name,
       Games: author.items.map do |game|
           {
               name: game.multiplayer,
               last_played_at: game.last_played_at
               publish_date: game.publish_date
           }
         end
       }
    end 
    write_json(author, 'authors.json')
 end
 
 

      

end