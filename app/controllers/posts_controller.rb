class PostsController < ApplicationController
  layout "three_column"

  def index
    @posts = Post.all
    @users = User.all
  end

  def create
    final_params = post_params
    final_params[:user] = User.find(post_params[:user])
    post = Post.create(final_params)
    if !post.valid?
      flash[:errors] = post.errors.messages
    end
    redirect_to "/posts"
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user)
    end
end
