class ApplicationController < ActionController::Base
  layout "application"

  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || app_advertisements_path
    end

      # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

end
