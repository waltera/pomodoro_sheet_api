# frozen_string_literal: true

class ApplicationController < ActionController::API
  include RenderApiConcern

  before_action :doorkeeper_authorize!

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user
    current_resource_owner
  end
end
