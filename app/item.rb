require 'securerandom'
require 'time'
require_relative 'label'
require_relative 'genre'
require_relative 'author'
class Item
  attr_reader :id, :genre, :author, :label, :archived
  attr_accessor :publish_date

  def initialize(publish_date:, archived: false, id: nil)
    @id = id || SecureRandom.random_number(1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
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
