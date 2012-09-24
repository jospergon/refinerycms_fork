module Refinery
  class RolesUsers < Refinery::Core::BaseModel
    self.table_name = "#{Refinery::Core.config.table_prefix}roles_users"

    belongs_to :role
    belongs_to :user

  end
end
