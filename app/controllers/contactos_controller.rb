class ContactosController < ApplicationController

  before_action :authenticate_usuario!
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
      @datosgenerales = Cliente.find(params[:cliente_id]).datosgenerales
      respond_to do |format|
        format.js
      end
    end

    # GET /contactos/1/edit
    def edit
      @clientes = Cliente.order(:nombre).all
      @datosgenerales = Datosgenerale.where("cliente_id = ?", @contacto.cliente_id )
      dashboard_4
    end

    # POST /contactos
    # POST /contactos.json
    def create
      @clientes = Cliente.all
      @sucursales = Sucursal.where("cliente_id = ?", params[:contacto][:cliente_id])
      @contacto = Contacto.new(contacto_params)
      @contacto.cliente_id = params[:contacto][:cliente_id]
      @contacto.sucursal_id = params[:contacto][:sucursal_id]
      if(params[:email] != "")
        @contacto.email=params[:email]
      else
        @contacto.email=nil
      end
      respond_to do |format|
        if @contacto.save
          save_contact_accounts(@contacto.id)
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
      @clientes = Cliente.all
      @sucursales = Sucursal.where("cliente_id = ?", params[:contacto][:cliente_id])
      respond_to do |format|
        if @contacto.update(contacto_params)
          @contacto.cliente_id = params[:contacto][:cliente_id]
          @contacto.sucursal_id = params[:contacto][:sucursal_id]
          if(params[:email] != "")
            @contacto.email=params[:email]
          else
            @contacto.email=nil
          end
          @contacto.save!
          save_contact_accounts(params[:id])
          format.html { redirect_to @contacto, :notice => 'El Contacto ha sito actualizado correctamente.' }
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


      @contacto.destroy
      respond_to do |format|
        format.html { redirect_to contactos_url, notice: 'El Contacto ha sido eliminado exitosamente.'  }
        format.json { head :no_content }

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
    # Never trust parameters from the scary internet, only allow the white list through.
    def contacto_params
      params.require(:contacto).permit(:cliente_id, :nombre, :telefono, :ext, :cel, :email, :puesto, :sucursal_id, :skype, :funciones)
    end
    def dashboard_4
      render :layout => "layout_2"
    end

  end

# Todo: Falta reconstruir ALTA, BAJA y SHOW, Vista y controller