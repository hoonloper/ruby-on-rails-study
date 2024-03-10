class Number < ApplicationRecord
  validates_presence_of :float_num, :integer_num
end
