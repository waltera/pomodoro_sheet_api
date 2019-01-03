# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api', type: :request do
  describe 'GET #index' do
    let!(:task) { create(:task) }
    let!(:result) { TaskSerializer.new(Task.all).serialized_json }

    before do
      get '/tasks'
    end

    it { expect(response.body).to eq(result) }
  end
end
