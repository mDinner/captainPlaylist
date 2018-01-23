class SearchController < ApplicationController

	def index
		@custom_playlists = RSpotify::Playlist.search(params[:query])
		@custom_playlists = @custom_playlists[0..19]
		@playlist_query = params[:query]
		@playlist_source = 'Spotify'

		@any_services_connected = user_has_any_connected_services?
	end

end