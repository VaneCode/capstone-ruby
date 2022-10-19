require_relative '../app/label'
require_relative '../app/item'

describe Label do
  before :each do
    @label = Label.new(id: nil, title: 'Cookie', color: 'Black')
  end
  it 'Should be an object instance of label' do
    expect(@label).to be_an_instance_of Label
  end

  it 'Method getter for title has to return Cookie' do
    expect(@label.title).to eq 'Cookie'
  end

  it 'Method getter for color has to return Black' do
    expect(@label.color).to eq 'Black'
  end

  it 'Label has to have an empty array of items' do
    expect(@label.items).to eq []
  end

  it 'Method add_item should add the input item to the collection of items' do
    @item = Item.new(publish_date: '1990-01-20', archived: false)
    @label.add_item(@item)
    expect(@label.items).to have_attributes(size: 1)
  end

  it 'Method add_item should add self as a property of the item object' do
    @item = Item.new(publish_date: '1990-01-20', archived: false)
    @label.add_item(@item)
    expect(@item.label.title).to eq 'Cookie'
  end
end
