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
    retries, max_retries = 0, 3
    Ticket.transaction do
      begin
        already_ticket = Ticket.find_by(username: ticket_params[:username], screening_id: ticket_params[:screening_id])
        if already_ticket
          return json_response({ message: "이미 등록한 티켓입니다."}, :conflict)
        end

        ticket_count_by_screening = Ticket.where(screening_id: ticket_params[:screening_id]).count
        screening = Screening.left_joins(:theater).find(ticket_params[:screening_id])
        if ticket_count_by_screening >= screening.theater.max_audience_count
          json_response({ message: "티켓이 품절되었습니다."}, :bad_request)
        else
          ticket = Ticket.new(ticket_params)
          ticket.save!
          json_response(ticket, :created)
        end
      rescue ActiveRecord::StatementInvalid, ActiveRecord::Deadlocked => e
        puts "ERROR@@@ -> " + e.message
        retries += 1
        if retries <= max_retries
          sleep(0.1) # 필요에 따라 재시도 간격 조절
          retry
        else
          # 일정 횟수 이상 재시도한 경우 예외를 다시 던짐
          json_response({ message: e.message }, :unprocessable_entity)
        end
      end
    end
  end

  # 순수 API
  # def create
  #   already_ticket = Ticket.find_by(username: ticket_params[:username], screening_id: ticket_params[:screening_id])
  #   if already_ticket
  #     return json_response({ message: "이미 등록한 티켓입니다."}, :bad_request)
  #   end
  #
  #   ticket_count_by_screening = Ticket.where(screening_id: ticket_params[:screening_id]).count
  #   screening = Screening.left_joins(:theater).find(ticket_params[:screening_id])
  #
  #   if ticket_count_by_screening >= screening.theater.max_audience_count
  #     json_response({ message: "티켓이 품절되었습니다."}, :bad_request)
  #   else
  #     ticket = Ticket.new(ticket_params)
  #     ticket.save!
  #     json_response(ticket, :created)
  #   end
  # end

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
