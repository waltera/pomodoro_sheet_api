# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api' do
  describe 'GET #index' do
    let!(:task) { create(:task) }
    let!(:pomodoro) { create(:pomodoro, task: task) }
    let!(:result) { TaskSerializer.new(Task.all, include: [:pomodoros]).serialized_json }

    before do
      get '/tasks'
      print response.body
    end

    it { expect(response.body).to eq(result) }
  end
end
