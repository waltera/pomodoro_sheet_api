# frozen_string_literal: true

class TaskSerializer
  include FastJsonapi::ObjectSerializer

  attributes :description
end
