class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # before_action :log

  def log
  	Rails.logger.info "session[:spotify_user]: #{session[:spotify_user]}"
  	Rails.logger.info "session[:current_user]: #{current_user.inspect}"
  end

  # GET /playlists/search/:query
  def search_playlists_spotify
    @custom_playlists = RSpotify::Playlist.search(params[:query])
    @custom_playlists = @custom_playlists[0..19]
    render 'search'
  end

  def user_has_any_connected_services?
    if session[:spotify_user] === nil || session[:spotify_user] === {}
      return false
    end

    # todo - check for apple, tidal when connected

    return true
  end
end
