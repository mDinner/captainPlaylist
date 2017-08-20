Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :playlists

  root to: 'playlists#index'

  get '/auth/spotify/callback', to: 'users#spotify'

  # first the routes, then user#add_playlist refers to the specific
  # method in the users controller, then as: add_playlist refers
  # to what the helper path is generated (you can see it when
  # you run $ bin/rake routes)
  post '/users/add_playlist/:playlist_id', to: 'users#add_playlist', as: 'add_playlist'
  post '/users/follow_playlist_on_spotify/:playlist_id/:playlist_owner_id', to: 'users#follow_playlist_on_spotify', as: 'follow_playlist_on_spotify'
  get '/search/' => 'search#index'
 #  scope '/users' do
 #  	scope ':id' do
 #  		scope 'addPlaylist' do
 #  			scope ':playlist_id' do
	#   			post '/' => 'users#add_playlists'
	# 		end
 #  		end
 #  	end
 #  end

 #  as :user do
 #  	scope 'addPlaylist' do
	# 	scope ':playlist_id' do
 #  			post '/' => 'users#add_playlists'
	# 	end
	# end
 #  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
