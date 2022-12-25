Rails.application.routes.draw do
  get 'books/show'
  get 'books/edit'
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit]
  # get 'homes/top'
  # get 'homes/about'
  # get 'books/new'
  # get 'users/show'
  # get 'users/edit'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
