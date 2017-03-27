class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to posts_url
  end

  def index
  	@logged_in = true if logged_in?
  	@posts = Post.all
  end

  def logged_in_user
  	unless logged_in?
  		redirect_to root_url
  	end
  end

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
