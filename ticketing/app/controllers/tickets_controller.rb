class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = Ticket.all

    json_response(@tickets)
  end

  def show
    json_response(@ticket)
  end

  def create
    ticket = Ticket.new(ticket_params)
    ticket.save!

    json_response(ticket, :created)
  end

  def destroy
    @ticket.destroy

    head :no_content
  end

  private
  def ticket_params
    params.require(:ticket).permit(:username, :screening_id)
  end
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
