class Options
  def initialize
    @user_options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List of games',
      '4' => 'List all genres',
      '5' => 'List all labels',
      '6' => 'List all authors',
      '7' => 'Add a book',
      '8' => 'Add a music album',
      '9' => 'Add a game',
      '10' => 'Exit'
    }
  end

  def show_options
    puts 'Please choose one option'
    @user_options.each do |key, option|
      puts "#{key}) #{option}"
    end
  end
end
