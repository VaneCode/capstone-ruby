require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:, publish_date:)
    super(publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archieved?
    super || cover_state == 'bad'
  end

  def self.list_books(things)
    things.each_with_index do |thing, idx|
      puts "#{idx + 1}: #{book.label.title}, publisher #{book.publisher} on #{book.publish_date}" if thing.instance_of? Book
    end
  end

  def self.create_book(things)
    # Ask for the book's information
    puts 'Please insert the new book\'s information'
    print 'Publisher:'
    publisher = gets.chomp
    print 'Publishing date [0000-00-00]: '
    published_date = gets.chomp
    print "Cover's state [good/bad]: "
    cover_state = gets.chomp.downcase
    print 'Title: '
    title = gets.chomp.capitalize
    print "Cover's color: "
    color = gets.chomp
    print "Author's first name: "
    author_first_name = gets.chomp.capitalize
    print "Author's last name: "
    author_last_name = gets.chomp.capitalize
    print 'Genre: '
    genre = gets.chomp
    print 'Source: '
    source = gets.chomp
    # Create and add the book
    book = Book.new(publisher: publisher, cover_state: cover_state, publish_date: published_date)
    @label = Label.new(title: title, color: color)
    @label.add_item(@book)
    things << book
    puts "The book #{book.label.title} has been added successfully."
  end
end
