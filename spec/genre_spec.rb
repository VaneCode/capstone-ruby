require_relative '../item'
require_relative '../genre'

describe Genre do
 before :each do
    @genre = Genre.new('Fantasy')
  end
end