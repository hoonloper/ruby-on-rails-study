class Movie < ApplicationRecord
  # model association
  has_many :screenings, dependent: :destroy

  # validations
  validates_presence_of :title, :director
end
