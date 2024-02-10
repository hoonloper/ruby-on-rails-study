class Movie < ApplicationRecord
  # model association
  has_many :screenings

  # validations
  validates_presence_of :title, :director
end
