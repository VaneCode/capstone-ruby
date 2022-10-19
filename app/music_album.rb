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

  def create_album(music_albums , genres)
    puts 'Great! create your music!'
    puts 'Enter the music publish date: '
    publish_date = gets.chomp
    puts 'Is it on spotify? [yes/no]: '
    on_userchoice = gets.chomp

    case on_userchoice
    when 'yes'
      on_spotify = true
    when 'no'
      on_spotify = false
    else
      puts 'That was an invalid option'
      puts ''
    end

    music_albums << MusicAlbum.new( on_spotify, publish_date)
    genre = Genre.create_genre(genres)

    album = MusicAlbum.new(on_spotify, publish_date: '2010-01-01')
    music_albums << album
    genre = Genre.new
    genre.add_item(album)


  end

  def list_albums
    puts 'List of Albums'
    @music_album.each do |album|
      puts "Publish_date: #{album.publish_date}  on_spotify: #{album.on_spotify}"
    end
  end
end
