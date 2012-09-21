Refinery::Core::Engine.routes.prepend do
  namespace :admin, :path => Refinery::Core.config.admin_prefix_path do
    get 'dashboard', :to => 'dashboard#index', :as => :dashboard

    match 'disable_upgrade_message',
          :to => 'dashboard#disable_upgrade_message',
          :as => :disable_upgrade_message
  end
end
