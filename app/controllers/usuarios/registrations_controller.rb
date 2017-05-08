class Usuarios::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy, :desactivar, :activar]
  #before_action :load_usuario, only: [:create]
  prepend_before_filter :require_no_authentication, only: [:cancel]
  before_filter :sign_up_params, only: [:create]
  before_filter :account_update_params, only: [:update, :update_password]
  before_action :set_usuario, only: [:desactivar, :activar, :edit, :show]


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
    authorize! :read, Usuario
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
     authorize! :read, Usuario
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
     authorize! :read, Usuario
     build_resource(sign_up_params)

     resource.save
     respond_to do |format|
       format.html { redirect_to usuarios_url, notice: 'Usuario creado satisfactoriamente!'  }
       format.json { head :no_content }
     end

   end

  # GET /resource/edit
   def edit
     authorize! :read, Usuario
     render :edit, :layout => "layout_2"
   end


  def update_role
    logger.debug ' '
    logger.debug '----------------------'
    logger.debug 'entrando a update_role'
    logger.debug '----------------------'

    logger.debug ' '
    user = Usuario.find_by_id params[:usuario][:id]
    user.role = params[:usuario][:role]
    user.email= params[:usuario][:email]

    respond_to do |format|
      if user.save!
        format.html { redirect_to usuarios_path, notice: 'El usuario ha sido modificado exitosamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2"}
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end

    end
  end


  # PUT /resource
   def update
     authorize! :read, Usuario
     #self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
     self.resource = Usuario.find_by_id params[:usuario][:id]
     prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

     resource_updated = update_resource(resource, account_update_params)
     yield resource if block_given?
     if resource_updated
       if is_flashing_format?
         flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
             :update_needs_confirmation : :updated
         set_flash_message :notice, flash_key
       end
       #sign_in resource_name, resource, bypass: true
       #respond_with resource, location: after_update_path_for(resource)
       redirect_to usuarios_path, notice: 'Usuario actualizado exitosamente!'

     else
       clean_up_passwords resource
       respond_to do |format|
         format.html { render action: 'edit', :layout => "layout_2" }
         format.json { render json: resource.errors, status: :unprocessable_entity }

       end

     end
   end
  def show
    dashboard_4
  end
  # DELETE /resource
   def destroy
     authorize! :read, Usuario
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
  #  def configure_sign_up_params
  #    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role, :avatar, :avatar_file_name) }
  #  end
  def sign_up_params
    params.require(:usuario).permit(:email, :password, :password_confirmation, :role, :avatar)
  end
  # If you have extra params to permit, append them to the sanitizer.
  #  def configure_account_update_params
  #    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :role, :current_password, :avatar, :avatar_file_name) }
  #  end
  def account_update_params
    params.require(:usuario).permit(:role, :avatar, :email)
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
  def load_usuario
    @usuario = Usuario.new(sign_up_params)
  end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
