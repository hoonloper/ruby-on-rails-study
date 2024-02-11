class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :update, :destroy]
  def index
    @theaters = Theater.all

    json_response(@theaters)
  end

  def show
    json_response(@theater)
  end

  def create
    theater = Theater.new(theater_params)
    theater.save!

    json_response(theater, :created)
  end

  def update
    @theater.update(theater_params)

    head :no_content
  end

  def destroy
    Theater.destroy(params[:id])

    render status: :no_content
  end

  private
  def theater_params
    params.require(:theater).permit(:name, :max_audience_count)
  end
  def set_theater
    @theater = Theater.find(params[:id])
  end
end
