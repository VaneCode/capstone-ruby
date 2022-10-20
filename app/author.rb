class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name, id = nil)
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def self.add_author
    print "Author's first-name: "
    first_name = gets.chomp.capitalize
    print "Author's last-name: "
    last_name = gets.chomp.capitalize
    new(first_name, last_name)
  end

  def self.list_authors(games)
    if games.empty?
      puts "You don't have authors at the moment."
    else
      authors = []
      games.each do |game|
        authors << game.author
      end
      puts 'List of authors'
      authors.each_with_index do |author, idx|
        puts "#{idx + 1} ) First name: \"#{author.first_name}\" Last name: #{author.last_name}"
      end
    end
  end
end
