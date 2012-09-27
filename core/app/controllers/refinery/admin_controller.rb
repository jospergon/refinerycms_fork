# Filters added to this controller apply to all controllers in the refinery backend.
# Likewise, all the methods added will be available for all controllers in the refinery backend.
module Refinery
  class AdminController < ::ActionController::Base
    include ::Refinery::ApplicationController
    helper ApplicationHelper
    helper Refinery::Core::Engine.helpers
    include Refinery::Admin::BaseController

    # Set current user necesary for cancan access control
    def current_user
      @current_user ||= current_refinery_user
    end

  end
end
