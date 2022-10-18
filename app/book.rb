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
end
