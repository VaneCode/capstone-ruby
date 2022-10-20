require 'securerandom'
require 'set'
require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title:, color:, id: nil)
    @id = id || SecureRandom.random_number(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def self.list_labels(books)
    if books.empty?
      puts "You don't have labels at this moment."
    else
      labels = []
      books.each { |book| labels << book.label }
      puts "You have #{labels.size} labels:"
      labels.each_with_index do |label, index|
        puts "#{index + 1} Label: Title #{label.title}, color #{label.color}"
      end
    end
  end
end
