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

  def edit
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

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end
