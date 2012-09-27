module Refinery
  class RolesPermissions < Refinery::Core::BaseModel
    self.table_name = "#{Refinery::Core.config.table_prefix}roles_permissions"

    belongs_to :role
    belongs_to :permission

  end
end
