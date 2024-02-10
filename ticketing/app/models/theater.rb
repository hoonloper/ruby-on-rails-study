class Theater < ApplicationRecord
  # model association
  has_many :screenings

  # validations
  validates_presence_of :name
end
