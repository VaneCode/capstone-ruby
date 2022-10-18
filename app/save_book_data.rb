require json
require_relative 'book'
require_relative 'label'

class SaveBookData
  DATA_DIRECTORY = '../data_json/'.freeze

  def self.label_to_object(label)
    Label.new(id: label['id'], title: label['title'], color: label['color'])
  end

  def self.label_to_json(label)
    {
      id: label.id,
      title: label.title,
      color: label.color
    }
  end

  def self.book_to_object(book)
    label = label_to_object(book['label'])
    book = Book.new(id: book['id'],
                    publish_date: book['publish_date'],
                    cover_state: book['cover_state'],
                    publisher: book['publisher'],
                    archived: book['archived'])
    book.add_label(label)
    book
  end

  def self.book_to_json(book)
    {
      id: book.id,
      publish_date: book.publish_date,
      cover_state: book.cover_state,
      publisher: book.publisher,
      archived: book.archived,
      label: label_to_json(book.label)
    }
  end
end
