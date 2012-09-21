Refinery::Core::Engine.routes.prepend do
  match '/system/resources/*dragonfly', :to => Dragonfly[:refinery_resources]

  namespace :admin, :path => Refinery::Core.config.admin_prefix_path do
    resources :resources, :except => :show do
      get :insert, :on => :collection
    end
  end
end
