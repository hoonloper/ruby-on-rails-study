class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :update, :destroy]

  # GET /numbers
  def index
    @numbers = Number.all
    json_response(@numbers)
  end

  # POST /numbers
  def create
    @number = Number.create!(number_params)
    json_response(@number, :created)
  end

  # GET /numbers/:id
  def show
    json_response(@number)
  end

  # PUT /numbers/:id
  def update
    @number.update(number_params)
    head :no_content
  end

  # DELETE /numbers/:id
  def destroy
    @number.destroy
    head :no_content
  end

  private

  def number_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_number
    @number = Number.find(params[:id])
  end
end
