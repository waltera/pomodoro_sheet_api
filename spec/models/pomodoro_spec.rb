require 'rails_helper'

RSpec.describe Pomodoro, type: :model do
  describe '.relations' do
    it { should validate_presence_of(:task) }
  end
end
