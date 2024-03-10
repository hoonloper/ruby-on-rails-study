require 'rails_helper'

RSpec.describe Number, type: :model do
  # it { should validate_presence_of(:integer_num) }
  # it { should validate_presence_of(:float_num) }

  describe 'creating a number' do
    it 'successfully creates a new number with valid attributes' do
      number = Number.create(float_num: 1.6, integer_num: 1)

      expect(number).to be_persisted
      expect(number.float_num).to eq(1.6)
      expect(number.integer_num).to eq(1)
    end
  end

  describe 'finding a number' do
    let!(:number) { Number.create(float_num: 1.6, integer_num: 1) }

    it 'finds a number by id' do
      found_user = Number.find(number.id)

      expect(found_user).to eq(number)
    end

    it 'finds a number by integer_num' do
      found_user = Number.find_by(integer_num: 1)

      expect(found_user).to eq(number)
    end
  end
end