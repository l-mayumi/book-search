Rails.application.routes.draw do
  devise_for :users

  resources :books, except: :show

  root 'books#index'
  get 'dashboard', to: 'books#dashboard'
  get 'books/remove/:id', to: 'books#remove', as: 'remove_book'
  get 'search', to: 'books#search', as: 'search_book'
end
