# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  include_examples 'StatusConcernShared'

  describe '.relations' do
    it { should have_many(:pomodoros) }
  end

  describe '.validations' do
    it { should validate_presence_of(:description) }
  end

  describe '#pomodoros_done' do
    let!(:task) { create(:task) }
    let!(:pomodoro_1) { create(:pomodoro, task: task) }
    let!(:pomodoro_2) { create(:pomodoro, task: task) }
    let!(:pomodoro_3) do
      create(:pomodoro,
             task: task,
             start_at: DateTime.new(2018, 1, 1, 0, 0),
             end_at: DateTime.new(2018, 1, 1, 0, 25),
             status: :done)
    end

    subject { task.pomodoros_done.pluck(:id) }

    it { is_expected.to eq([pomodoro_3.id]) }
  end
end
