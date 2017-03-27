class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in(user)
  	user.remember
  	user.save
  	cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_digest
    session[:user_id] = user.id
    set_current_user(user)
  end

  def sign_out
  	@current_user = nil
  	cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
  end

  def set_current_user(user)
  	@current_user = user
  end

  def current_user
  	if (user_id = session[:user_id])
  		@current_user ||= User.find_by(id: user_id)
  	elsif (user_id = cookies.signed[:user_id])
  		user = User.find_by(id: user_id)
  		if user
  			sign_in(user)
  			set_current_user(user)
  		end
  	end
  end

  def logged_in?
    !current_user.nil?
  end
end
