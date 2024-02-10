require 'rails_helper'

RSpec.describe Screening, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:movie) }
  it { should belong_to(:theater) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:show_date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end