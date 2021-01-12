require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Tries to create an user' do
    let(:user) { User.last }

    it 'successfully' do
      params = { email: 'user@email.com', password: 'a1b2c3' }

      expect { User.create(params) }.to change { User.count }.by(1)
      expect(user.email).to eq(params[:email])
    end

    it 'and does not provide a password' do
      imcomplete_params = { email: 'user@email.com' }

      expect { User.create(imcomplete_params) }.to change { User.count }.by(0)
    end

    it 'and provides an invalid password' do
      invalid_params = { email: 'user@email.com', password: 'test' }

      expect { User.create(invalid_params) }.to change { User.count }.by(0)
    end
  end
end
