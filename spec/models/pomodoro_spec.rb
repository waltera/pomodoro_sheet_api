# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pomodoro do
  include_examples 'StatusConcernShared'

  describe '.relations' do
    it { should belong_to(:task) }
  end

  context 'Custom Validations' do
    before do
      pomodoro.save
    end

    describe '#validate_start_at' do
      context 'success' do
        let!(:pomodoro) { build(:pomodoro, start_at: DateTime.new(2018, 1, 1, 1), status: :done) }

        it { expect(pomodoro.errors[:start_at]).to eq([]) }
      end

      context 'success without done' do
        let!(:pomodoro) { build(:pomodoro, start_at: nil, status: :pending) }

        it { expect(pomodoro.errors[:start_at]).to eq([]) }
      end

      context 'fail' do
        let!(:pomodoro) { build(:pomodoro, start_at: nil, status: :done) }

        it { expect(pomodoro.errors[:start_at]).to eq(['não pode ficar em branco']) }
      end
    end

    describe '#validate_end_at' do
      context 'success' do
        let!(:pomodoro) { build(:pomodoro, end_at: DateTime.new(2018, 1, 1, 1), status: :done) }

        it { expect(pomodoro.errors[:end_at]).to eq([]) }
      end

      context 'success without done' do
        let!(:pomodoro) { build(:pomodoro, end_at: nil, status: :pending) }

        it { expect(pomodoro.errors[:end_at]).to eq([]) }
      end

      context 'fail' do
        let!(:pomodoro) { build(:pomodoro, end_at: nil, status: :done) }

        it { expect(pomodoro.errors[:end_at]).to eq(['não pode ficar em branco']) }
      end
    end

    describe '#validate_canceled_at' do
      context 'success' do
        let!(:pomodoro) { build(:pomodoro, canceled_at: DateTime.new(2018, 1, 1, 1), status: :canceled) }

        it { expect(pomodoro.errors[:canceled_at]).to eq([]) }
      end

      context 'success without canceled' do
        let!(:pomodoro) { build(:pomodoro, canceled_at: nil, status: :pending) }

        it { expect(pomodoro.errors[:canceled_at]).to eq([]) }
      end

      context 'fail' do
        let!(:pomodoro) { build(:pomodoro, canceled_at: nil, status: :canceled) }

        it { expect(pomodoro.errors[:canceled_at]).to eq(['não pode ficar em branco']) }
      end
    end
  end
end
