# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api' do
  describe 'GET #index' do
    let!(:task) { create(:task) }
    let!(:pomodoro) { create(:pomodoro, task: task) }
    let!(:result) { TaskSerializer.new(Task.all).serialized_json }

    before do
      get '/tasks'
    end

    it { expect(response.body).to eq(result) }
  end

  describe 'POST #create' do
    before do
      post '/tasks', params: { task: params }
    end

    context 'success' do
      let!(:params) { { description: 'Task Test', pomodoros: 2 } }

      it { expect(Task.count).to eq(1) }
      it { expect(Task.first.pomodoros.count).to eq(2) }
      it { expect(response.body).to eq(TaskSerializer.new(Task.first).serialized_json) }
    end

    context 'fail without description and pomodoros' do
      let!(:params) { { description: '' } }
      let!(:result) do
        {
          'description' => ['não pode ficar em branco'],
          'pomodoros'   => ['não pode ficar em branco', 'não é um número']
        }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(parsed_body).to eq(result) }
    end

    context 'fail with invalid pomodoros' do
      let!(:params) { { description: 'Task Test', pomodoros: 'A' } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(parsed_body).to eq('pomodoros' => ['não é um número']) }
    end

    context 'fail with negative pomodoros' do
      let!(:params) { { description: 'Task Test', pomodoros: '-1' } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(parsed_body).to eq('pomodoros' => ['deve ser maior que 0']) }
    end
  end
end
