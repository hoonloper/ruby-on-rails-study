require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should belong_to(:screening) }

  it 'validates uniqueness of username' do
    # Theater와 Movie를 먼저 생성
    theater = create(:theater)
    movie = create(:movie)

    # Screening을 생성할 때 생성한 Theater와 Movie를 지정
    screening = create(:screening, theater: theater, movie: movie)

    expect(build(:ticket, screening: screening)).to validate_uniqueness_of(:username)
  end
end
