require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.relations' do
    it { should validate_presence_of(:description) }
  end
end
