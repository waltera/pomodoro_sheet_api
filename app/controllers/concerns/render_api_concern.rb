# frozen_string_literal: true

# Use this to encapsulate default render logic
module RenderApiConcern
  extend ActiveSupport::Concern

  included do
    def render_paginated(collection, blueprint)
      render json: TableBlueprint.render(collection, blueprint, params)
    end

    def render_created(object, blueprint)
      render json: blueprint.render(object), status: :created
    end

    def render_updated(object, blueprint)
      render json: blueprint.render(object), status: :ok
    end

    def render_errors(errors)
      render json: errors, status: :unprocessable_entity
    end
  end
end
