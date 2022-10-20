require_relative '../app/book'
require_relative '../app/music_album'
require_relative '../app/game'
require_relative '../app/label'
require_relative '../app/save_book_data'
require_relative '../app/save_music_album_data'
require_relative 'options'

class App
  attr_reader :books, :music_albums, :movies

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
  end

  def read_data
    SaveBookData.read_books(@books)
    SaveMusicData.read_music(@music_albums)
    SaveMusicData.read_genres(@genres)
    # SaveGameData.read_games(@games)
  end

  def save_data
    SaveBookData.write_books(@books)
    SaveMusicData.write_music(@music_albums)
    SaveMusicData.write_genre(@genres)
    # SaveGameData.write_games(@games)
    # save_genre(@genres)
    # save_music(@music_album)
  end

  def run_choice(choice)
    case choice
    when 1 then Book.list_books(@books)
    when 2 then MusicAlbum.list_albums(@music_albums)
    when 3 then Game.list_games(@games)
    when 4 then Genre.list_genres(@genres)
    when 5 then Label.list_labels(@books)
    when 6 then Author.list_authors(@games)
    when 7 then Book.add_book(@books)
    when 8 then MusicAlbum.create_album(@music_albums, @genres)
    when 9 then Game.add_game(@games)
    when 10
      puts 'Bye ;)'
      save_data
    else puts 'Invalid option, please choose a number between 1 and 10'
    end
  end

  def run_app
    read_data
    user_choice = 0
    opts = Options.new
    puts "\nWelcome to My Catalog App!"
    while user_choice != 10
      opts.show_options
      user_choice = gets.chomp.to_i
      run_choice(user_choice)
    end
  end
end
