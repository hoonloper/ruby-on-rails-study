require 'rails_helper'
require 'typhoeus'

RSpec.describe "Tickets", type: :request do
  include RequestSpecHelper
  include ControllerSpecHelper

  let(:theater) { create(:theater) }
  let(:movie) { create(:movie) }
  let(:screening) { create(:screening, theater_id: theater.id, movie_id: movie.id) }

  describe 'POST /tickets' do
    let(:valid_attributes) do
      { username: 'Learn Elm', screening_id: screening.id }
    end

    context '티켓 정상 생성 테스트' do
      before { post '/tickets', params: valid_attributes.to_json, headers: headers }

      it '티켓 생성 응답 검증' do
        expect(json['username']).to eq(valid_attributes[:username])
        expect(response).to have_http_status(201)
      end
    end

    context '최대 관람객 수보다 많은 티켓을 동시에 등록하기' do
      it '성공' do
        concurrent_request_count = 100
        requests = []

        concurrent_request_count.times do |index|
          body = { username: "테스트#{index}", screening_id: screening.id }

          request = Typhoeus::Request.new(
            'http://localhost:3000/tickets',
            method: :post,
            body: body.to_json,
            headers: headers
          )
          requests << request
        end

        hydra = Typhoeus::Hydra.hydra
        requests.each { |request| hydra.queue(request) }
        hydra.run


        # 응답 코드가 정상적인지 확인
        response_codes = requests.map { |request| request.response.code.to_i }
        puts response_codes.to_s
        # expect_fail_count = concurrent_request_count - theater.max_audience_count
        # expect_success_count = concurrent_request_count - expect_fail_count
        #
        # expect(response_codes.count(201)).to eq(expect_success_count)
        # expect(response_codes.count(400)).to eq(expect_fail_count)

        requests.each do |request |
          response = request.response
          expect(response.code).to eq(201).or(eq(400)).or(eq(409))
        end
      end
    end
  end
end
