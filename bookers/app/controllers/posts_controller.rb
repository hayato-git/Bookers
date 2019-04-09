class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
       flash[:notice] = "successfully"
       redirect_to post_path(post.id)
    else
       render("posts/new")
    end
  end

  def index
    @posts = Post.all.order(created_at: :asc)
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end


  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end

end
