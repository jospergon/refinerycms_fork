Refinery::Core::Engine.routes.draw do
  filter(:refinery_locales) if defined?(RoutingFilter::RefineryLocales) # optionally use i18n.
  get 'wymiframe(/:id)', :to => 'fast#wymiframe', :as => :wymiframe
  get "#{Refinery::Core.config.admin_prefix_path}/message", :to => 'fast#message', :as => :message

  namespace :admin, :path => Refinery::Core.config.admin_prefix_path do
    root :to => 'dashboard#index'
    resources :dialogs, :only => [:index, :show]
  end

  match "/#{Refinery::Core.config.admin_prefix_path}/update_menu_positions", :to => 'admin/core#update_plugin_positions'

  get '/sitemap.xml' => 'sitemap#index', :defaults => { :format => 'xml' }
end
