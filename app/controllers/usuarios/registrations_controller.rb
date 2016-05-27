class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_scope!
  prepend_before_filter :require_no_authentication, only: [:cancel]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy, :desactivar, :activar]

  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update, :update_password]
  before_action :set_usuario, only: [:desactivar, :activar, :edit]


  def update_password
    @user = Usuario.find(current_user.id)

    if @user.update_with_password(account_update_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path, notice: 'Contraseña actualizada correctamente!'
    else
      redirect_to root_path, notice: @user.errors.messages

    end

  end

  def index
    @usuarios = Usuario.all
    dashboard_4
  end
  def desactivar
    respond_to do |format|
      @usuario.activo=false
      @usuario.save!
      format.html { redirect_to usuarios_path, notice: 'El usuario ha sido desactivado exitosamente.'  }
      format.json { head :no_content }
    end
  end
  def activar
    respond_to do |format|
      @usuario.activo=true
      @usuario.save!
      format.html { redirect_to usuarios_path, notice: 'El usuario ha sido activado exitosamente.'  }
      format.json { head :no_content }
    end
  end


  def dashboard_4
    render :layout => "layout_2"
  end
  # GET /resource/sign_up
   def new
     @usuario = Usuario.new
     dashboard_4
   end

  # POST /resource
   def create
     # usuario = Usuario.where(:email => params[:usuario][:email])
     # if (usuario.size > 0)
     #   if (usuario[0].activo)
     #
     #   end
     #
     #  end

     build_resource(sign_up_params)

     resource.save
     respond_to do |format|
       format.html { redirect_to usuarios_url, notice: 'Usuario creado satisfactoriamente!'  }
       format.json { head :no_content }
     end

   end

  # GET /resource/edit
   def edit
     render :edit, :layout => "layout_2"
   end

  # PUT /resource
   def update
     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
     prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

     resource_updated = update_resource(resource, account_update_params)
     yield resource if block_given?
     if resource_updated
       if is_flashing_format?
         flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
             :update_needs_confirmation : :updated
         set_flash_message :notice, flash_key
       end
       sign_in resource_name, resource, bypass: true
       respond_with resource, location: after_update_path_for(resource)
     else
       clean_up_passwords resource
       respond_to do |format|
         format.html { render action: 'edit', :layout => "layout_2" }
         format.json { render json: resource.errors, status: :unprocessable_entity }

       end

     end
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role) }
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :role, :current_password) }
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
