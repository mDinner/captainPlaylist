class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :log

  def log
  	Rails.logger.info "session[:spotify_user]: #{session[:spotify_user]}"
  	Rails.logger.info "session[:current_user]: #{current_user.inspect}"
  	# user = User.find(2)
  	# Rails.logger.info "session[:current_user]: #{user.inspect}"
  end

  # GET /playlists/search/:query
  def search_playlists_spotify
    Rails.logger.info "params[:query]: #{params[:query]}"
    Rails.logger.info "params.inspect: #{params.inspect}"
    @custom_playlists = RSpotify::Playlist.search(params[:query])
    @custom_playlists = @custom_playlists[0..19]
    render 'search'
  end
end
