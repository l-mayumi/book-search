require 'rails_helper'

feature 'Admin registers book' do
  before do
    User.create(email: 'user@email.com', password: 'a1b2c3')
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'a1b2c3'
    click_on 'Log in'
  end

  scenario 'successfully' do
    click_on 'Dashboard'
    click_on 'Register new book'

    fill_in 'Title', with: 'New book title'
    fill_in 'Author name', with: 'Anonymous'
    fill_in 'Description', with: 'Mysterious new book'
    click_on 'Save'

    expect(page).to have_css('h3', text: 'New book title')
  end

  scenario 'but does not fill in all obligatory fields' do
    click_on 'Dashboard'
    click_on 'Register new book'

    fill_in 'Title', with: 'In a hurry'
    click_on 'Save'

    expect(page).to have_css('span', text: 'Oops, try again!')
  end
end
