require_relative './music_album'

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
    music_genre = gets.chomp
    @genres << Genre.new(music_genre)
    save_genre(@genres)
  end
end
