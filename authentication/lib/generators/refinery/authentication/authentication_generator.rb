module Refinery
  class AuthenticationGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def generate_authentication_initializer
      template "config/initializers/refinery/authentication.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "authentication.rb")
    end
    def append_load_seed_data
      create_file "db/seeds.rb" unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Authentication extension
Refinery::Authentication::Engine.load_seed
        EOH
      end
    end
  end
end
