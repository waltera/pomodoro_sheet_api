# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api' do
  describe 'POST /oauth/token' do
    let!(:user) do
      create(:user, email: 'test@prov.com',
        password: '12341234',
        password_confirmation: '12341234')
    end
    context 'with success' do
      let(:auth_params) do
        {
          "grant_type" => "password",
          "username"   => "test@prov.com",
          "password"   => "12341234"
        }
      end

      before do
        post '/oauth/token', params: auth_params
      end

      it { expect(response).to have_http_status(:ok) }
      it 'has valid token' do
        token = parsed_body['access_token']
        get '/tasks', params: { access_token: token }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with fail' do
      let(:auth_params) do
        {
          "grant_type" => "password",
          "username"   => "test@prov.com",
          "password"   => "1234"
        }
      end

      before do
        post '/oauth/token', params: auth_params
      end

      it { expect(response).to have_http_status(:bad_request) }
    end
  end
end