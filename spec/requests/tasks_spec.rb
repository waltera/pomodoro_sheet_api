# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Api' do
  describe 'GET #index' do
    let!(:task)     { create(:task) }
    let!(:pomodoro) { create(:pomodoro, task: task) }
    let!(:result)   { TaskSerializer.new(Task.all).serialized_json }

    before do
      get '/tasks'
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(result) }
  end

  describe 'GET #show' do
    let!(:task)   { create(:task, :with_pomodoros) }
    let!(:result) { TaskSerializer.new(task).serialized_json }

    before do
      get "/tasks/#{task.id}"
    end

    it { expect(response).to have_http_status(:ok) }
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

  describe 'PUT #update' do
    before do
      put "/tasks/#{task.id}", params: { task: params }
      task.reload
    end

    context 'success' do
      let(:task)   { create(:task, :with_pomodoros) }
      let(:params) { { description: 'Changed', pomodoros: 1 } }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(TaskSerializer.new(task).serialized_json) }
      it { expect(task.description).to eq('Changed') }
      it { expect(task.pomodoros.count).to eq(1) }
    end

    context 'success adding pomodoro' do
      let(:task)   { create(:task, :with_pomodoros) }
      let(:params) { { description: 'Changed', pomodoros: 2 } }

      it 'should create pomodoro' do
        expect(task.pomodoros.count).to eq(2)
        expect(task.pomodoros.pluck(:first_try).uniq).to eq([true])
      end
    end

    context 'succes add pomodoro second planning' do
      let(:pomodoro_1) { build(:pomodoro, :status_done) }
      let(:pomodoro_2) { build(:pomodoro) }
      let(:task)       { create(:task, pomodoros: [pomodoro_1, pomodoro_2]) }
      let(:params)     { { description: 'Changed', pomodoros: 2 } }

      it 'should create pomodoro' do
        expect(task.pomodoros.count).to eq(3)
        expect(task.pomodoros.done.count).to eq(1)
        expect(task.pomodoros.pending.count).to eq(2)
        expect(task.pomodoros.pending.where(first_try: false).count).to eq(1)
      end
    end

    context 'success removing pomodoro' do
      let(:pomodoro_1) { build(:pomodoro, :status_done) }
      let(:pomodoro_2) { build(:pomodoro) }
      let(:pomodoro_3) { build(:pomodoro) }
      let(:task)       { create(:task, pomodoros: [pomodoro_1, pomodoro_2, pomodoro_3]) }
      let(:params)     { { description: 'Changed', pomodoros: 1 } }

      it 'should remove pomodoro' do
        expect(task.pomodoros.done.count).to eq(1)
        expect(task.pomodoros.pending.count).to eq(1)
      end
    end

    context 'fail' do
      let(:task)   { create(:task, :with_pomodoros) }
      let(:params) { { description: '', pomodoros: 1 } }
      let(:result) { { 'description' => ['não pode ficar em branco'] } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(parsed_body).to eq(result) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:task) { create(:task, :with_pomodoros) }

    before do
      delete "/tasks/#{task.id}"
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(Task.count).to eq(0) }
    it { expect(Pomodoro.count).to eq(0) }
  end
end
