require_relative '../app/item'

describe Item do
  before :each do
    @item = Item.new(publish_date: '1990-01-20', archived: false)
  end

  it 'Should be an object instance of Item' do
    expect(@item).to be_an_instance_of Item
  end

  it 'Method move_to_archive should change atribute archived to true' do
    @item.move_to_archive
    expect(@item.archived).to eql true
  end
end
