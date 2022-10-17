require 'securerandom'
require 'set'
require_relative 'item'

class Label
  attr_accessor :name
  attr_reader :id, :items

  def initialize(id:, name:)
    @id = id || SecureRandom.random_number(1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def list_labels(books)
    labels = Set.new
    books.each { |book| labels << book.label }
    puts "You have #{labels.size} labels:"
    labels.each_with_index do |label, index|
      puts "#{index + 1} Label: #{label.name}"
    end
  end
end
