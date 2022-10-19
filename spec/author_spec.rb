require './app/author'

describe 'Unit test for author' do
  before :each do
    @author = Author.new('Kelvin', 'Morgan')
  end
  context 'to test the initialize method' do
    it 'should create an instance of author' do
      expect(@author).to be_an_instance_of Author
    end
  end

  context 'should create the firstname and lastname of author' do
    it 'should create the firstname and lastname of author' do
      expect(@author.first_name).to eq 'Kelvin'
      expect(@author.last_name).to eq 'Morgan'
    end
  end
end
