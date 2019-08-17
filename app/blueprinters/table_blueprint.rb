# frozen_string_literal: true

class TableBlueprint
  def self.render(collection, blueprint_class, params)
    limit = params[:limit] || 10
    offset = (params[:page] || 0) * limit
    meta = { total: collection.size }
    blueprint_class.render(collection.limit(limit).offset(offset), root: :rows, meta: meta)
  end
end
