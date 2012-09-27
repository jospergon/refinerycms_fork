require 'refinerycms-core'
require 'devise'
require 'friendly_id'
require 'cancan'

module Refinery
  autoload :AuthenticationGenerator, 'generators/refinery/authentication/authentication_generator'
  autoload :AuthenticatedSystem, 'refinery/authenticated_system'
  autoload :SetCrudifyPermissionsController, 'refinery/set_crudify_permissions_controller'

  class << self
    attr_accessor :authentication_login_field
    def authentication_login_field
      @authentication_login_field ||= 'login'
    end
  end

  module Authentication
    require 'refinery/authentication/engine'
    require 'refinery/authentication/configuration'

    class << self
      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
