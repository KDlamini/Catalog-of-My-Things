require_relative '../author'
require_relative '../item'

describe Author do
  context 'Author class Test' do
    first_name = 'hamid'
    last_name = 'faris'
    author = Author.new(first_name, last_name)

    it 'has first_name equal to "hamid"' do
      expect(author.first_name).to eq('hamid')
    end

    it 'has last_name equal to "faris"' do
      expect(author.last_name).to eq('faris')
    end

    item = Item.new('2021/06/10')
    author.add_item(item)

    it 'should have 1 item after calling add_item' do
      expect(author.items.size).to eq(1)
      expect(author.items[0]).to eq(item)
    end

    author.add_item(item)

    it 'should still have 1 item after calling add_item with the same item' do
      expect(author.items.size).to eq(1)
      expect(author.items[0]).to eq(item)
    end

    it 'item should have it as author' do
      expect(item.author).to eq(author)
    end
  end
end
