class ApplicationController < ActionController::Base
  helper_method :current_user, :loged_in?
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : false
  end

  def loged_in?
    !!current_user
  end

end