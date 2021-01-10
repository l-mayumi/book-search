require 'rails_helper'

feature 'Admin visits homepage and signs in' do
  before do
    User.create(email: 'user@email.com', password: 'a1b2c3')
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'a1b2c3'
    click_on 'Log in'

    expect(page).to have_css('a', text: 'Log out')
  end

  scenario 'but the password is not valid' do
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    expect(page).to have_css('a', text: 'Sign in')
  end

  scenario 'and logs out' do
    visit root_path
    click_on 'Sign in'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'a1b2c3'
    click_on 'Log in'
    click_on 'Log out'

    expect(page).to have_css('a', text: 'Sign in')
  end
end
