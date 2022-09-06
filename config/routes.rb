Rails.application.routes.draw do
  get 'users/index'
  get 'comments/index'
  get 'comments/create'
  get 'comments/new'
  get 'comments/destroy'

  
  devise_for :users
  resources :posts do
    resources :comments 
  end
  resources :users
  resources :likes, only: [:create, :destroy]  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
end
