require_relative '../app/genre'
require_relative '../app/item'

describe Genre do
  before :each do
    @genre = Genre.new('Fantasy')
  end

  it 'takes in one parameter and returns a Genre object' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'has a name' do
    expect(@genre.name).to eq('Fantasy')
  end

  it 'contains added genre items' do
    expect(@genre.items).to eq([])
  end

  it 'Method add_item should add self as a property of the item object' do
    @item = Item.new(publish_date: '1990-01-20', archived: false)
    @genre.add_item(@item)
    expect(@item.genre.name).to eq 'Fantasy'
  end
end
