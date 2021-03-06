class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      flash[:notice] = "Welcome back, #{@user.email}!"
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.renew_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
