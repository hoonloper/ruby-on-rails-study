require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  include RequestSpecHelper
  include ControllerSpecHelper

  # create test user
  let!(:user) { create(:user) }
  # set headers for authorization
  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  # TODO: 테스트 실패 원인 찾기
  describe "#authorize_request" do
    context "when auth token is passed" do
      before { allow(request).to receive(:headers).and_return(headers) }

      # private method authorize_request returns current user
ㅎ      it "sets the current user" do
        expect(subject.instance_eval { authorize_request }).to eq(user)
      end
    end

    context "when auth token is not passed" do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it "raises MissingToken error" do
        expect { subject.instance_eval { authorize_request } }.
          to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end