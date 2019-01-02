# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pomodoro, type: :model do
  describe '.relations' do
    it { should belong_to(:task) }
  end
end
