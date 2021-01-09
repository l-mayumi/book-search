require 'rails_helper'

feature 'Admin updates book' do
  before do
    User.create(email: 'user@email.com', password: 'a1b2c3')
    Book.create(title: Faker::Book.title, author_name: Faker::Book.author, description: Faker::Quote.famous_last_words)
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'a1b2c3'
    click_on 'Log in'
  end

  scenario 'successfully' do
    click_on 'Dashboard'
    click_on 'Edit'

    fill_in 'Title', with: 'A new new book title'
    click_on 'Save'

    expect(page).to have_css('h3', text: 'A new new book title')
  end

  scenario 'but does not fill in all obligatory fields' do
    click_on 'Dashboard'
    click_on 'Edit'

    fill_in 'Title', with: ''
    click_on 'Save'

    expect(page).to have_css('span', text: 'Oops, try again!')
  end
end
