class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all

    render json: @tickets.as_json, status: :ok
  end

  def show
    ticket = Ticket.find(params[:id])

    render json: ticket.as_json, status: :ok
  end

  def create
    ticket = Ticket.new(ticket_params)
    ticket.save!

    render json: ticket.to_json, status: :created
  end

  def destroy
    Ticket.destroy(params[:id])

    render status: :no_content
  end

  private
  def ticket_params
    params.require(:ticket).permit(:username, :screening_id)
  end
end
