# frozen_string_literal: true

class MeController < ApplicationController
  def index
    render json: UserBlueprint.render(current_user)
  end
end