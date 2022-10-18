require_relative './musicalbum'

class Genre
  attr_accessor :items, :name, :id

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end
  
  def add_item(item)
    @items << item
    item.genre = self
  end

   def list_genres
    puts 'List of Genres'
    @genres.each do |genre|
      puts "#{@genres.index(genre) + 1}): #{genre.name}"
    end
  end

  def create_genres
    puts 'Enter the genre name: '
    name = gets.chomp
    @genres << Genre.new(name)
    save_genre(@genres)
  end
  
end