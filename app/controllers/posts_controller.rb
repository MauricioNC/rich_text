class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created successfully"
    else
      render :new, notice: "Something went wrong, try again"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end
