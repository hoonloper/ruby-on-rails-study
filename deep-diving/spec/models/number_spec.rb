require 'rails_helper'

RSpec.describe Number, type: :model do
  it { should validate_presence_of(:integer_num) }
  it { should validate_presence_of(:float_num) }

  it '문자열 실수가 정수 컬럼에 저장된다면?' do
    number = Number.create!(float_num: 1.6, integer_num: '1.6')

    expect(number.reload.integer_num).to eq(1)
  end

  it '문자열 정수가 실수 컬럼에 저장된다면?' do
    number = Number.create!(float_num: '1', integer_num: 1)

    expect(number.reload.float_num).to eq(1)
  end

  describe '예상되는 케이스' do
    describe '정수 컬럼에 실수 저장' do
      it '실수를 정수 컬럼에 저장할 때 쿼리로 변환 과정중 타입 에러를 발생시킨다.' do
        expect { Number.create!(float_num: 1.6, integer_num: 1.6) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it '실수가 정수 컬럼에 저장되지만 소수점은 모두 잘리고 저장된다. (1.6 -> 1)' do
        number = Number.create!(float_num: 1.6, integer_num: 1.6)

        expect(number.reload.integer_num).to eq(1)
      end

      it '실수가 정수 컬럼에 저장되지만 반올림되어 저장된다. (1.6 -> 2)' do
        number = Number.create!(float_num: 1.6, integer_num: 1.6)

        expect(number.reload.integer_num).to eq(2)
      end
    end
    describe '실수 컬럼에 정수 저장' do
      it '정수를 실수 컬럼에 저장할 때 쿼리로 변환 과정중 타입 에러를 발생시킨다.' do
        expect { Number.create!(float_num: 1, integer_num: 1) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it '정수가 실수 컬럼에 저장되지만 소수점을 적용한 후 저장된다. (1 -> 1.0)' do
        number = Number.create!(float_num: 1, integer_num: 1)

        expect(number.reload.float_num).to eq(1.0)
      end
    end
  end
end