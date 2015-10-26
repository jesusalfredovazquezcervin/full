class Usuarios::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     self.resource = resource_class.new(sign_in_params)
     clean_up_passwords(resource)
     yield resource if block_given?
     respond_with(resource, serialize_options(resource), :layout => "empty")
   end

  # POST /resource/sign_in
   def create
     usuario = Usuario.where(:email => params[:usuario][:email])
     if (usuario.size > 0)
       if (usuario[0].activo)
         self.resource = warden.authenticate!(auth_options)
         set_flash_message(:notice, :signed_in) if is_flashing_format?
         sign_in(resource_name, resource)
         yield resource if block_given?

         role = usuario[0].role
         case role # was case obj.class
           when "Admin"
             respond_with resource, location: after_sign_in_path_for(resource)
           when "Operador"
             respond_with resource, location: captures_path
           else # Consulta
             respond_with resource, location: pages_invoice_path
         end
       else
         respond_to do |format|
           format.html { redirect_to new_usuario_session_path, notice: 'Usuario inactivo!'  }
           format.json { head :no_content }
         end
       end
     else
       self.resource = warden.authenticate!(auth_options)
       set_flash_message(:notice, :signed_in) if is_flashing_format?
       sign_in(resource_name, resource)
       yield resource if block_given?
       respond_with resource, location: after_sign_in_path_for(resource)
     end



   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
   def dashboard_4
     render :layout => "layout_2"
   end
end
