require_relative 'item'
require_relative 'validation'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:, publish_date:, archived: false, id: nil)
    super(publish_date: publish_date, archived: archived, id: id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    if books.empty?
      puts "You don't have books at this moment."
    else
      books.each_with_index do |book, idx|
        puts "#{idx + 1}: #{book.label.title}, publisher #{book.publisher} on #{book.publish_date}"
      end
    end
  end

  def self.add_book(books)
    # Ask for the book's information
    puts 'Please insert the new book\'s information'
    # Book
    print 'Publisher:'
    publisher = gets.chomp.capitalize
    published_date = Validation.validation_date('Publishing date')
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
    @label.add_item(book)
    books << book
    puts "The book #{book.label.title} has been added successfully."
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
