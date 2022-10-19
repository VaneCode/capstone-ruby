require_relative 'item'
require './app/save_music_album_data'
require './app/genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify:, publish_date:)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end

  def create_album(music_albums, genres)
    puts 'Great! create your music!'
    puts 'Enter the music publish date [0000-00-00]:'
    publish_date = gets.chomp '2001-01-23'
    puts 'Is it on spotify? [yes/no]: '
    on_userchoice = gets.chomp 'yes'

    case on_userchoice
    when 'yes'
      on_spotify = true
    when 'no'
      on_spotify = false
    else
      puts 'That was an invalid option'
      puts ''
    end
    new_genre = Genre.create_genre(genres)
    album = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    new_genre.add_item(album)
    music_albums << album
    puts 'Your music has been created successfully.'
  end

  def list_albums
    puts 'List of Albums'
    @music_album.each do |album|
      puts "Publish_date: #{album.publish_date}  on_spotify: #{album.on_spotify}"
    end
  end
end
