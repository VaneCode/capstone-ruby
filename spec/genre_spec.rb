require_relative '../app/genre'
require_relative '../app/genre'

describe Genre do
 before :each do
    @genre = Genre.new('Fantasy')
  end

  it 'takes in one parameter and returns a Genre object' do
      expect(@genres).to be_an_instance_of(Genre)
    end

  it 'has a name' do
    expect(@genre.name).to eq('Fantasy')
  end

  it 'is able to add items' do
    @genre.add_item(Item.new('2000-01-01'))
    expect(@genre.items.length).to eq(1)
  end

  it 'contains added genre items' do
    expect(@genre.items).to eq([])
  end
end