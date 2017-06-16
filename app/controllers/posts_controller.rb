  class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post =  Post.create(params[post_params])
    if @post.save
      redirect_to posts_path notice: "Your Post was saved"
    else
      render "new"
    end
  end

end
