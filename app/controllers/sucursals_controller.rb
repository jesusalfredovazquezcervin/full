
class SucursalsController < ApplicationController
  before_action :set_sucursal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

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
    @clientes = Cliente.all
    @contactos = Contacto.where("cliente_id = ?", Cliente.first.id)
    @sucursal = Sucursal.new
    dashboard_4
  end

  def update_contactos
    @contactos= Contacto.where("cliente_id = ?", params[:cliente_id])
    d=Contacto.new()
    @contactos.push(d)
    @contactos.reverse!

    respond_to do |format|
      format.js
    end
  end

  # GET /sucursals/1/edit
  def edit
    @clientes = Cliente.all
    @contactos = Contacto.where(:cliente_id => @sucursal.cliente_id)
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
      params.require(:sucursal).permit(:cliente_id, :nombre, :telefono, :contacto_id, :recepcionista_id, :contactoprincipal_id, :contactosecundario_id)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
end
