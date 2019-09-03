# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api' do
  describe 'GET #index' do
    context 'with authenticated' do
      let!(:user) { create(:user) }
      let!(:result) { { 'id' => user.id, 'name' => user.name } }

      before do
        authenticate(user)
        get '/me'
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(parsed_body).to eq(result) }
    end

    context 'without authenticated' do
      before do
        get '/me'
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end