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
end
