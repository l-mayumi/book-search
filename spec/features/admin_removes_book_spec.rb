require 'rails_helper'

feature 'Admin removes book' do
  before do
    User.create(email: 'user@email.com', password: 'a1b2c3')
    Book.create(title: 'Book title with a typo',
                author_name: Faker::Book.author,
                description: Faker::Quote.famous_last_words)
    visit root_path
    click_on 'Sign in', match: :first

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'a1b2c3'
    click_on 'Log in'
  end

  scenario 'successfully' do
    click_on 'Dashboard', match: :first
    click_on 'Remove', match: :first

    click_on 'Yes'

    expect(page).to have_css('a', text: 'Register new book')
    expect(page).not_to have_css('h6', text: 'Book title with a typo')
  end

  scenario 'but cancels' do
    click_on 'Dashboard', match: :first
    click_on 'Remove', match: :first

    click_on 'Cancel'

    expect(page).to have_css('h6', text: 'Book title with a typo')
  end
end
