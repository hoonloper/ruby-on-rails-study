require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should belong_to(:screening) }

  it { should validate_presence_of(:username) }
end
