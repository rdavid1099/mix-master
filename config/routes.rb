Rails.application.routes.draw do

  resources :artists do
    resources :songs, only: [:new, :create, :index, :destroy]
  end

  resources :songs, only: [:show, :edit, :update]
  get '/songs', to: "songs#index_all"

  get '/playlists', to: "playlists#index"
  get '/playlists/:id', to: "playlists#show"
  get '/playlists/new', to: "playlists#new"
  post '/playlists', to: "playlists#create"
end
