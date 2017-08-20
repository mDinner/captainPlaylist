class SearchController < ApplicationController

	def index
		Rails.logger.info "params[:query]: #{params[:query]}"
		Rails.logger.info "params.inspect: #{params.inspect}"
		@custom_playlists = RSpotify::Playlist.search(params[:query])
		@custom_playlists = @custom_playlists[0..19]
	end

end