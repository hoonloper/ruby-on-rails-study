class Ticket < ApplicationRecord
  belongs_to :screening

  validates :username, uniqueness: true
end
