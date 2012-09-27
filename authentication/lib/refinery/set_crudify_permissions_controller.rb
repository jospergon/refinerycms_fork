module Refinery
  module SetCrudifyPermissionsController
    def SetCrudifyPermissionsController.included(base)
      base.before_filter  :set_read_permission, :only => [:index, :show]
      base.before_filter  :set_create_permission, :only => [:new, :create]
      base.before_filter  :set_update_permission, :only => [:edit, :update]
      base.before_filter  :set_delete_permission, :only => :destroy
      base.class_eval do
        def set_read_permission
          #puts "\nset_read_permission, clazz => Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}\n"
          #puts "\ncurrent_user name => #{current_user.username} || current_user role => #{current_user.role.blank? ? "" : current_user.role.title}\n" 
          authorize! :read, "Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}".constantize
        end

        def set_create_permission
          #puts "set_create_permission, clazz => Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}"
          #puts "\ncurrent_user name => #{current_user.username} || current_user role => #{current_user.role.blank? ? "" : current_user.role.title}\n" 
          authorize! :create, "Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}".constantize
        end

        def set_update_permission
           #puts "set_update_permission, clazz => Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}"
           #puts "\ncurrent_user name => #{current_user.username} || current_user role => #{current_user.role.blank? ? "" : current_user.role.title}\n" 
          authorize! :update, "Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}".constantize
        end

        def set_delete_permission
           #puts "set_delete_permission, clazz => Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}"
           #puts "\ncurrent_user name => #{current_user.username} || current_user role => #{current_user.role.blank? ? "" : current_user.role.title}\n" 
          authorize! :delete, "Refinery::#{self.class.name.gsub("Controller", "").split('::')[-1].singularize}".constantize
        end 

        protected :set_read_permission, :set_create_permission, :set_update_permission, :set_delete_permission

      end
    end
  end
end
