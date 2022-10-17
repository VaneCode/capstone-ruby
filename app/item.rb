require 'securerandom'
require 'time'
class Item
  attr_reader :id, :genre, :author, :source, :label, :archived
  attr_accessor :publish_date

  def initialize(publish_date:, archived:)
    @id = SecureRandom.random_number(1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archieved?
  end

  private

  def can_be_archieved?
    temp_date = Time.parse(@publish_date)
    Time.new.year - temp_date.year > 10
  end
end
# item = Item.new(publish_date: '1990-01-20', archived: false)
# item.move_to_archive
