class BlogController < ApplicationController
  def index
    @posts = Post.all

  end

  def test
    @condition = false
    @temp = "안녕하세요!"
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.description = params[:description]
    post.save

    redirect_to "/"
  end

  def update
    @post = Post.find(params[:postId])

    # post = Post.update
    # post.title = params[:title]
    # post.description = params[:description]
    # post.save

    # redirect_to "/"
  end

  def delete
    Post.destroy(params[:postId])

    redirect_to "/"
  end

  def updateAction
    @id = params[:id]
    post = Post.find(@id)
    post.title = params[:title]
    post.description = params[:description]
    post.save

    redirect_to "/"
  end
end
