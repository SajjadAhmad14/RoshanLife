class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : false
  end
end