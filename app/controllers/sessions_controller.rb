class SessionsController < ApplicationController

  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "#{ t :you_are_singed_in }"
    else
      flash[:error] = t :invalid_email_or_password
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "#{ t :you_are_signed_out }"
  end
end
