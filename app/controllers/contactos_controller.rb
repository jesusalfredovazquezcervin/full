class ContactosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_contacto, only: [:create]
  load_and_authorize_resource
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

    # GET /contactos
    # GET /contactos.json
    def index
      @contactos = Contacto.all
      dashboard_4
    end

    # GET /contactos/1
    # GET /contactos/1.json
    def show
      dashboard_4
    end

    # GET /contactos/new
    def new
      @contacto = Contacto.new
      @clientes = Cliente.all.order(:nombre)
      # @sucursales = Sucursal.where("cliente_id = ?", Cliente.first.id)
      @datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.order(:nombre).first.id)
      dashboard_4
    end

    def update_datosgenerales
      logger.debug '--------------------'
      logger.debug '  '
      logger.debug 'Entrando a update_datosgenerales'
      logger.debug params
      logger.debug '  '
      logger.debug '--------------------'
      #@datosgenerales = Cliente.find(params[:cliente_id]).datosgenerales
      @datosgenerales = Datosgenerale.where(cliente_id: params[:cliente_id])
      respond_to do |format|
        format.js
      end
    end

    # GET /contactos/1/edit
    def edit
      @clientes = Cliente.order(:nombre).all
      @datosgenerales = Datosgenerale.where("cliente_id in (?)", @contacto.clientes.collect{|c| c.id})
      dashboard_4
    end

    # POST /contactos
    # POST /contactos.json
    def create
      @clientes = Cliente.all
      @sucursales = Sucursal.where("cliente_id = ?", params[:contacto][:cliente_id])
      @contacto = Contacto.new(contacto_params)
      #@contacto.cliente_id = params[:contacto][:cliente_id]
      @contacto.sucursal_id = params[:contacto][:sucursal_id]
      #@datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.find_by_id(params[:contacto][:cliente_id]) )
      @datosgenerales = Datosgenerale.where(cliente_id: params[:cliente_id])
      if(params[:email] != "")
        @contacto.email=params[:email]
      else
        @contacto.email=nil
      end
      respond_to do |format|
        if @contacto.save
          save_contact_accounts(@contacto.id)
          save_contact_clients @contacto.id
          format.html { redirect_to @contacto, notice: 'Contacto ha sido creado exitosamente' }
          format.json { render action: 'show', status: :created, location: @contacto }
        else
          format.html { render action: 'new',  :layout => "layout_2" }
          format.json { render json: @contacto.errors, status: :unprocessable_entity }
        end


      end
    end

    # PATCH/PUT /contactos/1
    # PATCH/PUT /contactos/1.json
    def update
      cliente_id = @contacto.cliente_id
      @clientes = Cliente.all
      @sucursales = Sucursal.where("cliente_id = ?", params[:contacto][:cliente_id])
      respond_to do |format|
        if @contacto.update(contacto_params)
          #@contacto.cliente_id = params[:contacto][:cliente_id]
          #@contacto.sucursal_id = params[:contacto][:sucursal_id]
          ReportRecipient.where(contacto_id: params[:id]).each{|c| c.destroy} if cliente_id != params[:contacto][:cliente_id]

          if(params[:email] != "")
            @contacto.email=params[:email]
          else
            @contacto.email=nil
          end
          @contacto.save!
          save_contact_accounts(params[:id])
          save_contact_clients params[:id]
          format.html { redirect_to @contacto, :notice => 'El Contacto ha sido actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit', :layout => "layout_2"}
          format.json { render json: @contacto.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /contactos/1
    # DELETE /contactos/1.json
    def destroy
      #ContactAccount.where(contacto_id: @contacto.id).each{|c| c.destroy}
      #ContactClient.where(contacto_id: @contacto.id).each{|c| c.destroy}
      @contacto.destroy
      respond_to do |format|
        format.html { redirect_to contactos_url, notice: 'El Contacto ha sido eliminado exitosamente.'  }
        format.json { head :no_content }

      end

    end

    # Metodo que crea un usuario asociado al contacto
    def crear_usuario
      require 'keepass/password'
      contacto = Contacto.find_by_id params[:id]
      password = KeePass::Password.generate('uullA{8}')
      respond_to do |format|
        if !Usuario.find_by_email(contacto.email)
          Usuario.create(email: contacto.email, password: password, password_confirmation: password, role: "Consulta", contacto_id: contacto.id).send_reset_password_instructions
          format.html { redirect_to contactos_path, notice: 'El usuario ha sido creado exitosamente.'  }
          format.json { head :no_content }
        else
          user = Usuario.find_by_email(contacto.email)
          user.contacto_id = contacto.id
          user.save
          user.send_reset_password_instructions
          format.html { redirect_to contactos_path, notice: 'Se han enviado instrucciones al usuario'  }
          format.json { head :no_content }
        end


      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end
    def save_contact_accounts(contacto_id)
      ContactAccount.where(contacto_id: params[:id]).each{|c| c.destroy}
      params[:accounts].each{|a|
        ContactAccount.create(contacto_id: contacto_id, datosgenerale_id: a) unless ContactAccount.where(contacto_id: contacto_id, datosgenerale_id: a).exists?
      }
    end
    def save_contact_clients(contacto_id)
      ContactClient.where(contacto_id: params[:id]).each{|c| c.destroy}
      params[:cliente_id].each{|c|
        ContactClient.create(contacto_id: contacto_id, cliente_id: c) unless ContactClient.where(contacto_id: contacto_id, cliente_id: c).exists?
      }
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def contacto_params
      params.require(:contacto).permit(:cliente_id, :nombre, :telefono, :ext, :cel, :email, :puesto, :sucursal_id, :skype, :funciones, :avatar)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
    def load_contacto
      @contacto = Contacto.new(contacto_params)
    end
  end
