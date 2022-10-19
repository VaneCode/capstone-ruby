class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @item.include?(item)
    item.add_author(self)
  end

  def self.add_author
    print 'Please enter the first-name of the author '
    first_name = gets.chomp
    print 'Please enter the last-name of the author '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def self.list_all_authors(games)
    games.each_with_index do |game, idx|
      puts "#{idx + 1} ) First name: \"#{game.author.first_name}\" Last name: #{game.author.last_name}"
    end
  end
end
