# frozen_string_literal: true

module StatusConcern
  extend ActiveSupport::Concern

  included do
    enum status: %i[pending canceled done]
  end
end
