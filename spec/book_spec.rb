require_relative '../classes/book'

describe Book do
  let(:base_params) do
    {
      id: 1,
      genre: 'Fiction',
      author: 'John Doe',
      label: 'Bestseller Books',
      publish_date: '2010-01-01',
      archived: false,
      publisher: 'Book Publisher',
      cover_state: 'good'
    }
  end

  subject(:book) { described_class.new(base_params) }

  describe '#initialize' do
    it 'initializes a Book object with the given parameters' do
      expect(book.id).to eq(1)
      expect(book.genre).to eq('Fiction')
      expect(book.author).to eq('John Doe')
      expect(book.label).to eq('Bestseller Books')
      expect(book.publish_date).to eq(Date.parse('2010-01-01'))
      expect(book.archived).to be_falsey
      expect(book.publisher).to eq('Book Publisher')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'returns true' do
        book.cover_state = 'bad'
        book.move_to_archive
        expect(book.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when cover state is good and publish date is over 10 years ago' do
      it 'archives the book' do
        book.move_to_archive
        expect(book.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when cover state is good but publish date is recent' do
      it 'does not archive the book' do
        book.publish_date = Date.today
        book.move_to_archive
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
