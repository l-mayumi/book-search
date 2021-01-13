require 'rails_helper'

feature 'Visitor visits homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h3', text: 'Welcome to BookSearch!')
    expect(page).to have_css('a', text: 'Sign in')
  end

  scenario 'but can not access the dashboard' do
    visit dashboard_path

    expect(current_path).to eq(new_user_session_path)
  end
end
