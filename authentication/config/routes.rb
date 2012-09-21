Refinery::Core::Engine.routes.append do
  namespace :admin, :path => Refinery::Core.config.admin_prefix_path do
    resources :users, :except => :show
  end
end

Refinery::Core::Engine.routes.draw do
  begin
    require 'devise'
    devise_for :refinery_user,
               :class_name => 'Refinery::User',
               :path => "#{Refinery::Core.config.admin_prefix_path}/users",
               :controllers => { :registrations => "#{Refinery::Core.config.admin_prefix_path}/users" },
               :skip => [:registrations],
               :path_names => { :sign_out => 'logout',
                                :sign_in => 'login',
                                :sign_up => 'register' }

    # Override Devise's other routes for convenience methods.
    devise_scope :refinery_user do
      get "/#{Refinery::Core.config.admin_prefix_path}/login", :to => "sessions#new", :as => :new_refinery_user_session
      get "/#{Refinery::Core.config.admin_prefix_path}/logout", :to => "sessions#destroy", :as => :destroy_refinery_user_session
      get "/#{Refinery::Core.config.admin_prefix_path}/users/register" => 'users#new', :as => :new_refinery_user_registration
      post "/#{Refinery::Core.config.admin_prefix_path}/users/register" => 'users#create', :as => :refinery_user_registration
    end
  rescue RuntimeError => exc
    if exc.message =~ /ORM/
      # We don't want to complain on a fresh installation.
      if (ARGV || []).exclude?('--fresh-installation')
        puts "---\nYou can safely ignore the following warning if you're currently installing Refinery as Devise support files have not yet been copied to your application:\n\n"
        puts exc.message
        puts '---'
      end
    else
      raise exc
    end
  end
end
