# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pomodoro, type: :model do
  include_examples 'StatusConcernShared'

  describe '.relations' do
    it { should belong_to(:task) }
  end

  describe '#validate_end_at' do
    before do
      pomodoro.save
    end

    context 'success' do
      let!(:pomodoro) do
        build(:pomodoro,
              start_at: DateTime.new(2018, 1, 1, 1),
              end_at: DateTime.new(2018, 1, 1, 1))
      end

      it { expect(pomodoro.errors[:end_at]).to eq([]) }
    end

    context 'fail' do
      let!(:pomodoro) { build(:pomodoro, start_at: DateTime.new(2018, 1, 1, 1)) }

      it { expect(pomodoro.errors[:end_at]).to eq(['não pode ficar em branco']) }
    end
  end
end
