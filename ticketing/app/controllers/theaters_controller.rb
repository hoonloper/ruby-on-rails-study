class TheatersController < ApplicationController
  def index
    @theaters = Theater.all

    render json: @theaters.as_json, status: :ok
  end

  def show
    theater = Theater.find(params[:id])

    render json: theater.as_json, status: :ok
  end

  def create
    theater = Theater.new(theater_params)
    theater.save!

    render json: theater.to_json, status: :created
  end

  def destroy
    Theater.destroy(params[:id])

    render status: :no_content
  end

  private
  def theater_params
    params.require(:theater).permit(:name, :max_audience_count)
  end
end
