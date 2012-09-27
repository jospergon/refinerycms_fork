# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  # Set current user necesary for cancan access control
  def current_user
    @current_user ||= current_refinery_user
  end

end
