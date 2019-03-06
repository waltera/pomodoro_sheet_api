# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Work Api' do
  describe 'POST #create' do
    context 'with pomodoros' do
      let!(:task) { create(:task, :with_pomodoros) }

      before do
        post "/tasks/#{task.id}/work"
        task.reload
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(TaskSerializer.new(task).serialized_json) }
      it { expect(task.pomodoros.done.count).to eq(1) }
    end

    context 'without pomodoros' do
      let!(:task) { create(:task) }

      before do
        post "/tasks/#{task.id}/work"
        task.reload
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(TaskSerializer.new(task).serialized_json) }
      it { expect(task.pomodoros.done.where(first_try: false).count).to eq(1) }
    end
  end
end
