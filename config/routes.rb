Rails.application.routes.draw do
  root to: 'home#index'
  # get 'home/index'
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  # root 'chat_rooms#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/message/:id", to: "chat_rooms#create_message"

  post '/create-notice', to: 'notices#create'
  get '/notifications', to: 'notices#notifications'
end
