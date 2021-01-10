Rails.application.routes.draw do
  devise_for :users

  resources :books

  root 'books#index'
  get 'dashboard', to: 'books#dashboard'
  get 'books/remove/:id', to: 'books#remove', as: 'remove_book'
end
