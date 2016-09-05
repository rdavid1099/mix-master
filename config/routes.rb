Rails.application.routes.draw do

  resources :artists do
    resources :songs, only: [:new, :create, :index, :destroy]
  end

  resources :songs, only: [:show, :edit, :update]
  get '/songs', to: "songs#index_all"

  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
