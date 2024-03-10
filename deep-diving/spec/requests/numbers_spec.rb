require 'rails_helper'

RSpec.describe 'Numbers API', type: :request do
  # initialize test data
  let!(:numbers) { create_list(:number, 10) }
  let(:number) { numbers.first.id }

  describe 'POST /numbers' do
    # valid payload
    let(:valid_attributes) { { integer_num: 1, float_num: 1.1 } }

    context 'when the request is valid' do
      before { post '/numbers', params: valid_attributes }

      it 'creates a number' do
        expect(json['integer_num']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end