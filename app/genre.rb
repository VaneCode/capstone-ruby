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

  def self.list_genres(genres)
    puts 'List of Genres'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}): #{genre.name}"
    end
  end

  def self.create_genre(genres)
    print 'Genre: '
    genre = gets.chomp
    genre = Genre.new(genre)
    genres << genre
    genre
  end
end
