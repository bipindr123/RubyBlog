class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => "your post has been saved"
    else
      render "new"
    end
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :body)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path, :notice => "your post is updated"
    else
        render "edit"
    end
  end

  def new
    @post = Post.new()
    @category = Category.all
  end

  def edit
    @post = Post.find(params[:id])
    @category = Category.all
  end

  def update
  end

  def destroy
  end

end
