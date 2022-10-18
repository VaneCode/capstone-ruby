require_relative '../app/genre'
require_relative '../app/genre'

describe Genre do
 before :each do
    @genre = Genre.new('Fantasy')
  end

  it 'has a name' do
    expect(@genre.name).to eq('Fantasy')
  end

  it 'add genre items' do
    expect(@genre.items).to eq([])
  end
end