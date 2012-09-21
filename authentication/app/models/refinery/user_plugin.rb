module Refinery
  class UserPlugin < Refinery::Core::BaseModel
    self.table_name = "betycms_user_plugins"

    belongs_to :user
    attr_accessible :user_id, :name, :position

  end
end
