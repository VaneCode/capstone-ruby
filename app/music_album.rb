require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :public_date

  def initialize( publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end

  def create_album
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
