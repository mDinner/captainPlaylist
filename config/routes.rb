Rails.application.routes.draw do
  resources :users
  resources :playlists

  root 'playlists#index'

  get '/auth/spotify/callback', to: 'users#spotify'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
