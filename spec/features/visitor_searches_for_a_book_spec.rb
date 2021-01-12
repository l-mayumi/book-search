require 'rails_helper'

# This spec is not working because Capybara/Selenium are not running js effects,
# despite turning on 'js = true'.
xfeature 'Visitor searches for a book' do
  before do
    Book.create(title: 'Alice in Wonderland',
                description: 'Young girl falls through a rabbit hole',
                author_name: 'Lewis Carrol')
    Book.create(title: 'Hamlet',
                description: 'The ghost of the King tells his son to avenge his murder',
                author_name: 'William Shakespeare')
  end

  scenario 'by author name' do
    visit root_path
    fill_in 'Search', with: 'William'
    choose('Author')
    click_on 'Go'

    expect(page).to have_css('h3', text: 'Hamlet')
    expect(page).not_to have_css('h3', text: 'Alice in Wonderland')
  end

  scenario 'by title' do
    visit root_path
    fill_in 'Search', with: 'Hamlet'
    choose('Title/Description')
    click_on 'Go'

    expect(page).to have_css('h3', text: 'Hamlet')
    expect(page).not_to have_css('h3', text: 'Alice in Wonderland')
  end

  scenario 'by description' do
    visit root_path
    fill_in 'Search', with: 'ghost'
    choose('Title/Description')
    click_on 'Go'

    expect(page).to have_css('h3', text: 'Hamlet')
    expect(page).not_to have_css('h3', text: 'Alice in Wonderland')
  end
end
