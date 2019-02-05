# frozen_string_literal: true

# Use this to encapsulate default render logic
module RenderApiConcern
  extend ActiveSupport::Concern

  included do
    def render_created(object, serializer)
      render json: serializer.new(object).serialized_json, status: :created
    end

    def render_errors(errors)
      render json: errors, status: :unprocessable_entity
    end
  end
end
