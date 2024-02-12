class Theater < ApplicationRecord
  # model association
  has_many :screenings, dependent: :destroy

  # validations
  validates_presence_of :name, :max_audience_count
end
