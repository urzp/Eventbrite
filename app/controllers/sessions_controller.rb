class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      flash[:success] =
         "#{user.name} Welcome to the Sample App!"
      sign_in(user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to	user
    else
      flash[:danger] = 'Invalid email'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
