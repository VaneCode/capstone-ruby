require_relative '../app/book'
require_relative '../app/label'

describe Book do
  before :each do
    @book = Book.new(publisher: 'Pinguin Readers', cover_state: 'bad', publish_date: '2018-01-20', archived: false)
    @label = Label.new(id: nil, name: 'Cookie')
    @label.add_item(@book)
  end

  it 'Should be an object instance of Book' do
    expect(@book).to be_an_instance_of Book
  end

  it 'Method getter for publisher should return Pinguin Readers' do
    expect(@book.publisher).to eql 'Pinguin Readers'
  end

  it 'Method getter for cover_state should return bad' do
    expect(@book.cover_state).to eql 'bad'
  end

  it 'Method can_use_services? should return true because cover_state is equal to bad' do
    @book.move_to_archive
    expect(@book.archived).to eql true
  end
end
