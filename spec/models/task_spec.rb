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
end
