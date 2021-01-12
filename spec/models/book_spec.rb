require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { Book.last }
  let(:params) do
    {
      title: Faker::Book.title,
      description: Faker::Quote.famous_last_words,
      image: Faker::Avatar.image(slug: Faker::Book.title),
      author_name: Faker::Book.author
    }
  end

  context 'Creating a book' do
    it 'successfully' do
      expect { Book.create(params) }.to change { Book.count }.by(1)
      expect(book.title).to eq(params[:title])
    end

    it 'and does not provide all values' do
      create_book = Book.create(author_name: Faker::Book.author)

      expect { create_book }.to change { Book.count }.by(0)
    end
  end

  context 'Editing a book' do
    let(:other_book) { Book.create(params) }
    let(:new_params) do
      { title: 'Cooking 101', description: 'Learn how to cook',
        image: Faker::Avatar.image(slug: 'cooking'), author_name: 'Secret Chef' }
    end
    let(:empty_params) { { title: '', description: '', author_name: '' } }

    it 'successfully' do
      other_book.update(new_params)

      expect(other_book.title).to eq(new_params[:title])
      expect(other_book.description).to eq(new_params[:description])
      expect(other_book.image).to eq(new_params[:image])
      expect(other_book.author_name).to eq(new_params[:author_name])
    end

    it 'but the values provided are invalid' do
      other_book.update(empty_params)
      other_book.reload

      expect(other_book.title).not_to eq(new_params[:title])
      expect(other_book.description).not_to eq(new_params[:description])
      expect(other_book.image).not_to eq(new_params[:image])
      expect(other_book.author_name).not_to eq(new_params[:author_name])
    end
  end

  context 'Removing a book' do
    before do
      Book.create(params)
    end

    it 'successfully' do
      expect { Book.last.destroy }.to change { Book.count }.by(-1)
    end
  end
end
