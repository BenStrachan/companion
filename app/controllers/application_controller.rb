class ApplicationController < ActionController::Base
  layout "application"

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to after_unauthorized_path, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
      format.csv  {
        redirect_to after_unauthorized_path, alert: exception.message
      }
    end
  end

  protected
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || app_advertisements_path
    end

      # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def after_unauthorized_path
      if user_signed_in?
        dashboards_index_path
      else
        root_path
      end
    end
end
