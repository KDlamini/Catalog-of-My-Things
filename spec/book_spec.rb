require_relative '../book'

describe Book do
  before :each do
    @book_library = [Book.new('J.K Rowling', 'New', '2006-06-25'), Book.new('James Green', 'Good', '2016-05-03')]
  end

  it 'Can be archived?' do
    can_be_archived = @book_library[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'Can be archived?' do
    can_be_archived = @book_library[1].send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
