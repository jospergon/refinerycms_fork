module Refinery
  class Permission < Refinery::Core::BaseModel
    self.table_name = "#{Refinery::Core.config.table_prefix}permissions"

    has_and_belongs_to_many :roles, :join_table => "#{Refinery::Core.config.table_prefix}roles_permissions"

    attr_accessible :action, :subject_class, :name, :description

  end
end
