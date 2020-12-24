class SessionsController < ApplicationController
  def new
  
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'User does not exist. You need to sign up!'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_path, notice: 'You have successfully logged out.' if @user.nil?
  end

end
