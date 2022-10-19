require_relative '../app/book'
require_relative '../app/music_album'
require_relative '../app/game'
require_relative '../app/label'
require_relative '../app/save_book_data'
require_relative 'options'

class App
  attr_reader :books, :music_albums, :movies

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @movies = []
  end

  def read_data
    SaveBookData.read_books(@books)
    # SaveAlbumData.read_music_albums(@music_albums)
    # SaveGameData.read_games(@games)
    # read genres
  end

  def save_data
    SaveBookData.write_books(@books)
    # SaveAlbumData.write_music_albums(@music_albums)
    # SaveGameData.write_games(@games)
    # save_genre(@genres)
  end

  def run_choice(choice)
    case choice
    when 1 then Book.list_books(@books)
    when 2 then Music_Album.list_albums(@music_albums)
    when 3 then Game.list_games(@games)
    when 4 then puts 'list all genres'
    when 5 then Label.list_labels(@books)
    when 6 then puts 'list all authors'
    when 7 then Book.add_book(@books)
    when 8 then Music_Album.add_book(@music_albums)
    when 9 then Game.add_game(@game)
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
