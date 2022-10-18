require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state
    def initialize(publisher:,cover_state:, publish_date:)
        super(publish_date: publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_use_services?
        puts cover_state
        super || cover_state == "bad"
    end
end

book = Book.new(publisher: 'Pinguin Readers', cover_state: 'bad', publish_date: '2018-01-20')
puts book.archived
book.can_use_services?
book.move_to_archive
puts book.archived
