Rails.application.routes.draw do
  # resources :likes
  resources :chat_messages, only: [:index, :create, :show]
  resources :chats, only: [:show, :create]
  resources :friendships, only: [:create, :update, :destroy]
  resources :friends, only: [:index, :show, :create]
  resources :posts, only: [:create, :index, :show, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy] #create - signup
  post '/login', to: 'auth#create'
  get '/me', to: 'users#me' #profile page
  mount ActionCable.server => '/cable'
  patch '/update_bio/:id', to: 'users#bio_edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
