
class SucursalsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_sucursal, only: [:create]
  load_and_authorize_resource
  before_action :set_sucursal, only: [:show, :edit, :update, :destroy]


  # GET /sucursals
  # GET /sucursals.json
  def index
    @sucursals = Sucursal.all
    dashboard_4
  end

  # GET /sucursals/1
  # GET /sucursals/1.json
  def show

    dashboard_4
  end

  # GET /sucursals/new
  def new
    @clientes = Cliente.all.order(nombre: :asc)
    @contactos = Cliente.first.contactos.order(nombre: :asc)
    @sucursal = Sucursal.new
    dashboard_4
  end

  def update_contactos
    @contactos= Cliente.find(params[:cliente_id]).contactos.order(nombre: :asc)
    respond_to do |format|
      format.js
    end
  end

  # GET /sucursals/1/edit
  def edit
    @clientes = Cliente.all.order(nombre: :asc)
    @contactos = @sucursal.cliente.contactos(nombre: :asc)
    dashboard_4
  end

  # POST /sucursals
  # POST /sucursals.json
  def create
    @sucursal = Sucursal.new(sucursal_params)
    respond_to do |format|
      if @sucursal.save
        format.html { redirect_to @sucursal, notice: 'Sucursal was successfully created.' }
        format.json { render action: 'show', :layout => "layout_2", status: :created, location: @sucursal }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1
  # PATCH/PUT /sucursals/1.json
  def update
    respond_to do |format|
      if @sucursal.update(sucursal_params)
        @sucursal.save!

        format.html { redirect_to @sucursal, notice: 'Sucursal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursals/1
  # DELETE /sucursals/1.json
  def destroy
    @sucursal.destroy
    respond_to do |format|
      format.html { redirect_to sucursals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sucursal_params
      params.require(:sucursal).permit(:cliente_id, :nombre, :telefono, :contacto_id, :recepcionista_id, :main_id, :secondary_id)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
    def load_sucursal
      @sucursal = Sucursal.new(sucursal_params)
    end
end
