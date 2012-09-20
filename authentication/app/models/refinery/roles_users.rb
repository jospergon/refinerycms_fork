module Refinery
  class RolesUsers < Refinery::Core::BaseModel
    set_table_name "betycms_roles_users"

    belongs_to :role
    belongs_to :user

  end
end
