require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  context 'Genre class Test' do
    name = 'HipHop'
    genre = Genre.new(name)

    it 'has name equal to "HipHop"' do
      expect(genre.name).to eq('HipHop')
    end

    item = Item.new('2022/01/5')
    genre.add_item(item)

    it 'should have 1 item after calling add_item' do
      expect(genre.items.size).to eq(1)
      expect(genre.items[0]).to eq(item)
    end

    genre.add_item(item)

    
      expect(item.genre).to eq(genre)
    end
  end
end
