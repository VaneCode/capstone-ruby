require './app/item'

class Genre
  attr_accessor :items, :name, :id

  def initialize(name, id = nil)
    @id = id || Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def self.list_genres(genres)
    if genres.empty?
      puts "You don't have genres at the moment."
    else
      non_repeat = []
      genres.each { |genre| non_repeat << genre.name unless non_repeat.include?(genre.name) }
      puts 'List of Genres'
      non_repeat.each_with_index do |name, index|
        puts "#{index + 1}): #{name}"
      end
    end
  end

  def self.create_genre(genres)
    print 'Genre: '
    genre = gets.chomp.capitalize
    genre = Genre.new(genre)
    genres << genre
    genre
  end
end
