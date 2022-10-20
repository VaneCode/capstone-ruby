require_relative 'item'
require_relative 'genre'
require_relative 'validation'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify:, publish_date:, id: nil)
    super(publish_date: publish_date, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end

  def self.create_album(music_albums, genres)
    puts 'Great! create your music!'
    publish_date = Validation.validation_date('Enter the music publish date')
    on_userchoice = Validation.valid_yes_no('Is it on spotify? [Y/N]: ')
    new_genre = Genre.create_genre(genres)
    album = MusicAlbum.new(publish_date: publish_date, on_spotify: on_userchoice == 'Y')
    new_genre.add_item(album)
    music_albums << album
    puts 'Your music has been created successfully.'
  end

  def self.list_albums(music_albums)
    if music_albums.empty?
      puts "You don't music albums at that moment."
    else
      puts 'List of Albums'
      music_albums.each_with_index do |album, idx|
        aviable = album.on_spotify ? 'yes' : 'no'
        puts "#{idx + 1}) Publishing date: #{album.publish_date}, genre: #{album.genre.name}, aviable on spotify: #{aviable}."
      end
    end
  end
end
