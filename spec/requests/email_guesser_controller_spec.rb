require 'rails_helper'

RSpec.describe Api::V1::EmailGuesserController, type: :controller do
  describe 'POST #analyze' do
    let(:valid_params) { { first_name: 'Arvind', last_name: 'Mehra', domain: 'google.com' } }
    let(:invalid_params) { { first_name: 'FirstName', domain: 'example.com' } }

    context 'with valid parameters' do
      it 'returns a successful response' do
        post :analyze, params: valid_params
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['email']).to eq('arvindmehra@google.com')
      end
    end

    context 'with invalid parameters' do
      it 'returns an error response' do
        post :analyze, params: invalid_params
        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end
end
