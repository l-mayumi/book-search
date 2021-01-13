require 'rails_helper'

RSpec.describe 'Searching for a book', type: :request do
  before do
    Book.create(title: 'Alice in Wonderland',
                description: 'Young girl falls through a rabbit hole',
                author_name: 'Lewis Carrol')
    Book.create(title: 'Hamlet',
                description: 'The ghost of the King tells his son to avenge his murder',
                author_name: 'William Shakespeare')
  end

  it 'by title' do
    get '/search', params: { q: 'Hamlet', filter: 'text', sort: 'asc' }

    result_list = JSON.parse(response.body, symbolize_names: true).pluck(:title)

    expect(result_list).to include('Hamlet')
    expect(result_list).not_to include('Alice in Wonderland')
    expect(response).to have_http_status(:ok)
  end

  it 'by description' do
    get '/search', params: { q: 'avenge', filter: 'text', sort: 'asc' }

    result_list = JSON.parse(response.body, symbolize_names: true).pluck(:title)

    expect(result_list).to include('Hamlet')
    expect(result_list).not_to include('Alice in Wonderland')
    expect(response).to have_http_status(:ok)
  end

  it 'by author' do
    get '/search', params: { q: 'William', filter: 'author', sort: 'asc' }

    result_list = JSON.parse(response.body, symbolize_names: true).pluck(:title)

    expect(result_list).to include('Hamlet')
    expect(result_list).not_to include('Alice in Wonderland')
    expect(response).to have_http_status(:ok)
  end

  it 'in alphabetical order' do
    get '/search', params: { q: 'a', filter: 'text', sort: 'asc' }

    result_list = JSON.parse(response.body, symbolize_names: true).pluck(:title)

    expect(result_list).to eq(['Alice in Wonderland', 'Hamlet'])
    expect(response).to have_http_status(:ok)
  end

  it 'in reverse alphabetical order' do
    get '/search', params: { q: 'a', filter: 'text', sort: 'desc' }

    result_list = JSON.parse(response.body, symbolize_names: true).pluck(:title)

    expect(result_list).to eq(['Hamlet', 'Alice in Wonderland'])
    expect(response).to have_http_status(:ok)
  end
end
