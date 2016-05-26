class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :set_locale
    around_filter :with_timezone

    def set_locale
      logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
      I18n.locale = extract_locale_from_accept_language_header
      logger.debug "* Locale set to '#{I18n.locale}'"
    end


    alias_method :current_user, :current_usuario# Could be :current_member or :logged_in_user
    rescue_from CanCan::AccessDenied do |exception|

      flash[:error] = "Accesso no permitido."
      role = current_user.role
      case role # was case obj.class
        when 'Admin'
          redirect_to root_url
        when 'Operador'
          redirect_to captures_path
        else # Consulta
          redirect_to root_url
      end
    end

    private
    def not_authenticated
      redirect_to login_url, :alert => "First login to access this page."
    end

    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
    def with_timezone
      timezone = Time.find_zone(cookies[:timezone])
      Time.use_zone(timezone) { yield }
    end

end
