module Refinery
  class Role < Refinery::Core::BaseModel
    self.table_name = "#{Refinery::Core.config.table_prefix}roles"

    has_and_belongs_to_many :users, :join_table => "#{Refinery::Core.config.table_prefix}roles_users"

    before_validation :camelize_title
    validates :title, :uniqueness => true

    def camelize_title(role_title = self.title)
      self.title = role_title.to_s.camelize
    end

    def self.[](title)
      find_or_create_by_title(title.to_s.camelize)
    end

  end
end
