class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render json: @movies.as_json, status: :ok
  end

  def show
    movie = Movie.find(params[:id])

    render json: movie.as_json, status: :ok
  end

  def create
    movie = Movie.new(movie_params)
    movie.save!

    render json: movie.to_json, status: :created
  end

  def destroy
    Movie.destroy(params[:id])

    render status: :no_content
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
