require_relative '../app/book'
require_relative '../app/music_album'
require_relative '../app/game'
require_relative '../app/movie'
require_relative '../app/handle_files'
require_relative 'options'

class App
  attr_reader :books, :music_albums, :movies

  def initialize
    @books = []
    @music_albmus = []
    @movies = []
  end

  def run_choice(choice)
    case choice
    when 1 then Book.list_books(@books)
    when 2 then Music_Album.list_albums(@music_albmus)
    when 3 then Movie.list_movies(@movies)
    when 4 then puts 'list all genres'
    when 5 then puts 'list all labels'
    when 6 then puts 'list all authors'
    when 7 then Book.add_book(@books)
    when 8 then Music_Album.add_book(@music_albmus)
    when 9 then Movie.add_movie(@movies)
    when 10 then puts 'Bye ;)'
    else puts 'Invalid option, please choose a number between 1 and 10'
    end
  end

  def run_app
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
