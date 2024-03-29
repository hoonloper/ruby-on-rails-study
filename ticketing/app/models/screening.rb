class Screening < ApplicationRecord
  # model association
  belongs_to :theater
  belongs_to :movie
  has_many :tickets, dependent: :destroy

  # validations
  validates_presence_of :show_date, :start_time, :end_time
end
