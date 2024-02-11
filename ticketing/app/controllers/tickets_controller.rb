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
    ticket_count_by_screening = Ticket.where(screening_id: ticket_params[:screening_id]).count
    screening = Screening.left_joins(:theater).find(ticket_params[:screening_id])

    if ticket_count_by_screening >= screening.theater.max_audience_count
      json_response({ message: "티켓이 품절되었습니다."}, :bad_request)
    else
      ticket = Ticket.new(ticket_params)
      ticket.save!
      json_response(screening, :created)
    end
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
