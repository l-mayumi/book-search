require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Tries to create an user' do
    it 'successfully' do
      user = User.create(email: 'user@email.com', password: 'a1b2c3')

      expect(User.last).to eq(user)
    end

    it 'and does not provide a password' do
      User.create(email: 'user@email.com')

      expect(User.count).to eq(0)
    end

    it 'and provides an invalid password' do
      User.create(email: 'user@email.com', password: 'test')

      expect(User.count).to eq(0)
    end
  end
end
