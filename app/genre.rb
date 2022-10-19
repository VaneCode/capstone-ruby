require './app/save_music_album_data'
require './app/item'

class Genre
  attr_accessor :items, :name, :id

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def list_genres(genres)
    puts 'List of Genres'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}): #{genre.name}"
    end
  end

  def create_genre(genres)
    puts 'Enter the genre name: '
    music_genre = gets.chomp
    genre = Genre.new(music_genre)
    genres << genre
    genre
  end
end
