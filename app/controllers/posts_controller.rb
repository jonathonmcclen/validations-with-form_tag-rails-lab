class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render "/posts/show"
  end

  def new
    @post = Post.new
    render "/posts/new"
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render new_post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
    render "/posts/edit"
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else 
      render "/posts/edit"
    end 

    
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
