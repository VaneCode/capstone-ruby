require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: ,
    publish_date:)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end

   def create_album
    puts 'Enter the music publish date: '
    publish_date = gets.chomp
    puts 'Is it on spotify? [y/n]: '
    on_userchoice = gets.chomp

    case on_userchoice
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    end

    @music_album << MusicAlbum.new(publish_date, on_spotify)
    save_music(@music_album)
  end

  def list_albums
      puts 'List of Albums'
      @music_album.each do |album|
        puts "Publish_date: #{album.publish_date}  on_spotify: #{album.on_spotify}"
      end
    end


end

