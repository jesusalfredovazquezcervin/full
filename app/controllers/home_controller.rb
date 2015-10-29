class HomeController < ApplicationController
  def index
    if usuario_signed_in?
      role = current_user.role
      case role # was case obj.class
        when 'Admin'
          dashboard_4
        when 'Operador'
          respond_to do |format|
            format.html { redirect_to captures_path}
            format.json { head :no_content }
          end
        else # Consulta
          dashboard_4
      end
    else
      dashboard_4
    end
  end
  def login
    render :layout => "empty"
  end
end
def dashboard_4
  render :layout => "layout_2"
end
