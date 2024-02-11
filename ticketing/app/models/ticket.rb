class Ticket < ApplicationRecord
  belongs_to :screening

  validates_uniqueness_of :username
end
