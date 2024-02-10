class ScreeningsController < ApplicationController
  def index
    @screenings = Screening.all

    render json: @screenings.as_json, status: :ok
  end

  def show
    screening = Screening.find(params[:id])

    render json: screening.as_json, status: :ok
  end

  def create
    screening = Screening.new(movie_params)
    screening.save!

    render json: screening.to_json, status: :created
  end

  def destroy
    Screening.destroy(params[:id])

    render status: :no_content
  end

  private
  def movie_params
    params.require(:screening).permit(:title, :director)
  end
end
