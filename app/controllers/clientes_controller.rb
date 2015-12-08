
class ClientesController < ApplicationController
  #before_filter :require_login
  before_action :set_cliente, only: [:show, :edit, :update, :destroy], except: [:update_tipocambio]
  #skip_before_action :set_cliente, :only => [:show, :edit, :update, :destroy]

  before_action :authenticate_usuario!
  #load_and_authorize_resource

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
    @total_clientes =Cliente.all.count
    dashboard_4

  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    dashboard_4
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    dashboard_4
  end

  # GET /clientes/1/edit
  def edit
    dashboard_4
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    @cliente.direccion_id = params[:post][:direccion_id]
    @cliente.formapago_id = params[:post][:formapago_id]
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'El Cliente ha sido creado exitosamente' }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        @cliente.direccion_id = params[:post][:direccion_id]
        @cliente.formapago_id = params[:post][:formapago_id]
        @cliente.save!
        format.html { redirect_to @cliente, :notice => 'El Cliente ha sito actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2"}
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_tipocambio
    cliente=Cliente.find params[:cliente][:id]
    cliente.tipoCambio=params[:cliente][:tipoCambio]
    cliente.tipocambio_updated_at=DateTime.now
    respond_to do |format|
      if cliente.save
        format.html { redirect_to({ controller:"captures",  action: 'index', id:params[:cliente][:id] }, notice: "Tipo cambio actualizado exitosamente") }
        format.json { head :no_content }
      else
        format.html { redirect_to({ controller:"captures",  action: 'index', id:params[:cliente][:id] }) }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy


    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'El Cliente ha sido eliminado exitosamente.'  }
      format.json { head :no_content }

    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nombre, :rfc, :direccion_id, :formapago_id, :nombreComercial, :tipoCambio)
    end
    def dashboard_4
      render :layout => "layout_2"
    end

end

