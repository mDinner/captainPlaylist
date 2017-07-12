class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :log

  def log
  	Rails.logger.info "session[:spotify_user]: #{session[:spotify_user]}"
  	Rails.logger.info "session[:current_user]: #{current_user.inspect}"
  	user = User.find(2)
  	Rails.logger.info "session[:current_user]: #{user.inspect}"
  end
end
