class PostsController < ApplicationController
  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: "Parameter is missing or the value is empty: #{exception.param}" }, status: :bad_request
  end

  def show
    post = Post.left_joins(:user).find(params[:id])

    render json: post.as_json, status: :ok
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: post.to_json, status: :accepted
    else
      render json: { error: '알 수 없는 서버 에러' }, status: :internal_server_error
    end
  end
  def create
    post = Post.new(post_params)
    post.user = default_user
    post.save! # save vs save!(rails Exception)

    render json: post.to_json, status: :created
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
