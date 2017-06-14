class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :log

  def log
  	Rails.logger.info "session[:spotify_user]: #{session[:spotify_user]}"
  end
end
