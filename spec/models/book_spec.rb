require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Tries to create a book' do
    it 'successfully' do
      book = Book.create(title: 'Book title #1',
                         description: 'Just a regular book. Nothing suspicious.',
                         image: '',
                         author_name: 'Isa Mistery')

      expect(Book.last).to eq(book)
    end

    it 'and does not provide all values' do
      Book.create(author_name: 'Joan Jett')

      expect(Book.count).to eq(0)
    end
  end
end
