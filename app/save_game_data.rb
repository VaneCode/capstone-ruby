require 'json'

module SaveGame
    def self.save_game(games)
        game_json = []
        games.each do |game|
          save_game  = { name: games.name, publish_date: games.publish_date
           mutiplayer: games.multiplayer  last_played_at: games.last_played_at }
        game_json << save_game
        end
        File.write('./data/games.json', JSON.generate(game_json))
    end


    def self.save_authors
        author_save = []
   @authors.each do |author|
       author << {
           first_name: author.first_name,
           last_name: author.last_name,
       Games: author.items.map do |game|
           {
               name: game.multiplayer,
               last_played_at: game.last_played_at,
               publish_date: game.publish_date
           }
         end
       }
    end 
    File.write('./data/author.json', JSON.generate(author_save))
 end
 def read_game(games)
    return books unless File.exist?('./app/')
   gamearr = JSON.parse(File.read('./app/author.json'))
   gamearr.each do |game|
    game_json = Game.new
    games << game_json
   end
end

 def read_author 
    file = read_json(authors.json)
    file.each do |author|
        author = Author.new(author['first_name'])
        author.last_name = author['last_name']
        author.items = author ['games'].map do |game|
        Game.new(game['name'], game['last_played_at'], game ['publish_date'])
        end 
    read_json(author, 'authors.json')
 end

      

end