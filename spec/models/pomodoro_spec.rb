# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pomodoro do
  include_examples 'StatusConcernShared'

  describe '.relations' do
    it { should belong_to(:task) }
  end

  describe '#fill_status_date' do
    let!(:result)   { DateTime.new(2019, 1, 1) }
    let!(:pomodoro) { create(:pomodoro, :with_task, :with_user) }
    let!(:mocks) do
      allow(DateTime).to receive(:now) { result }
    end

    before do
      pomodoro.update(status: status)
    end

    context 'success with done' do
      let(:status) { :done }

      it { expect(pomodoro.start_at).to eq(result - 25.minutes) }
      it { expect(pomodoro.end_at).to eq(result) }
    end

    context 'success with canceled' do
      let(:status) { :canceled }

      it { expect(pomodoro.canceled_at).to eq(result) }
    end
  end
end
