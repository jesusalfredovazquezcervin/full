class Usuarios::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
   def new
     self.resource = resource_class.new
     respond_with(resource, :layout => "empty")
   end

  # POST /resource/password
   def create
     self.resource = resource_class.send_reset_password_instructions(resource_params)
     yield resource if block_given?

     if successfully_sent?(resource)
       respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
     else
       #respond_with(resource, :layout => "empty")
       respond_to do |format|
         format.html { render action: 'new', :layout => "empty"}
         format.json { render json: self.resource, status: :unprocessable_entity }
       end
     end
   end

  # GET /resource/password/edit?reset_password_token=abcdef
   def edit
     self.resource = resource_class.new
     set_minimum_password_length
     resource.reset_password_token = params[:reset_password_token]
     respond_with(resource, :layout => "empty")
   end

  # PUT /resource/password
  #  def update
  #    super
  #  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
