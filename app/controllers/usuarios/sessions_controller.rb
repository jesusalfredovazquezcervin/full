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
     super


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
