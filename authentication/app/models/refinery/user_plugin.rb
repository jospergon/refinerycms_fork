module Refinery
  class UserPlugin < Refinery::Core::BaseModel
    self.table_name = "#{Refinery::Core.config.table_prefix}user_plugins"

    belongs_to :user
    attr_accessible :user_id, :name, :position

  end
end
