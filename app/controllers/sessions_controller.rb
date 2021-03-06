class SessionsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
  		sign_in(@user)
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def delete
  	sign_out
  	redirect_to root_url
  end
end
