class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    private
    def not_authenticated
        redirect_to login_url, :alert => "First login to access this page."
    end

    alias_method :current_user, :current_usuario# Could be :current_member or :logged_in_user
    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = "Accesso no permitido."
      redirect_to root_url
    end
end
