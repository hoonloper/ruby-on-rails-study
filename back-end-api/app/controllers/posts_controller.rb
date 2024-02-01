class PostsController < ApplicationController
  def show
    post = Post.find(params[:id])

    render json: post.to_json
  end
  def create
    post = Post.new(post_params)
    post.user = default_user
    post.save! # save vs save!(rails Exception)

    render json: post.to_json
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
