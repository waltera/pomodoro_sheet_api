# frozen_string_literal: true

RSpec.shared_examples 'StatusConcernShared' do |parameter|
  it 'declare status enum' do
    should define_enum_for(:status).with_values(%i[pending canceled done])
  end
end
