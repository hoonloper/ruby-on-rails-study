require 'rails_helper'

RSpec.describe Number, type: :model do
  it { should validate_presence_of(:integer_num) }
  it { should validate_presence_of(:float_num) }
end