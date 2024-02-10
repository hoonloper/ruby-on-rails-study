class Screening < ApplicationRecord
  # model association
  belongs_to :theater, dependent: :destroy
  belongs_to :movie, dependent: :destroy

  # validations
  validates_presence_of :show_date, :start_time, :end_time
end
