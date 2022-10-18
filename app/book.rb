require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:, publish_date:, archived: false)
    super(publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archieved?
    super || cover_state == 'bad'
  end

  def self.list_books(books)
    books.each_with_index do |book, idx|
      puts "#{idx + 1}: #{book.label.title}, publisher #{book.publisher} on #{book.publish_date}"
    end
  end

  def self.create_book(book)
    # Ask for the book's information
    puts 'Please insert the new book\'s information'
    # Book
    print 'Publisher:'
    publisher = gets.chomp
    print 'Publishing date [0000-00-00]: '
    published_date = gets.chomp
    print "Cover's state [good/bad]: "
    cover_state = gets.chomp.downcase
    # Label
    print 'Title: '
    title = gets.chomp.capitalize
    print "Cover's color: "
    color = gets.chomp
    # Create and add the book
    book = Book.new(publisher: publisher, cover_state: cover_state, publish_date: published_date)
    @label = Label.new(title: title, color: color)
    @label.add_item(@book)
    books << book
    puts "The book #{book.label.title} has been added successfully."
  end
end
