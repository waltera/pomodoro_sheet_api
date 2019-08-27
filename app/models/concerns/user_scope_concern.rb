module UserScopeConcern
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    scope :of_user, ->(user) { where(user: user) }
  end
end