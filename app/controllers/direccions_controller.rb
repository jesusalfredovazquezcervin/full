class DireccionsController < ApplicationController
  before_action :load_direccion, only: [:create]
  load_and_authorize_resource
  before_action :set_direccion, only: [:show, :edit, :update, :destroy]

  # GET /direccions
  # GET /direccions.json
  def index
    @direccions = Direccion.all
    dashboard_4
  end

  # GET /direccions/1
  # GET /direccions/1.json
  def show
    if(@direccion.mapsgoogle.nil? == false)
      latlon=@direccion.mapsgoogle.split(',')
      if (latlon.count >= 2)
        gon.latt = latlon[0]
        gon.long = latlon[1]
      end
    end
    dashboard_4
  end

  # GET /direccions/new
  def new
    @direccion = Direccion.new
    @clientes = Cliente.all
    @sucursales = Sucursal.where("cliente_id = ?", Cliente.first.id)
    dashboard_4
  end


  def update_sucursales
    @sucursales = Cliente.find(params[:cliente_id]).sucursals
    respond_to do |format|
      format.js
    end
  end


  # GET /direccions/1/edit
  def edit
    @clientes = Cliente.all
    @sucursales = @direccion.cliente.sucursals
    dashboard_4
  end



  # POST /direccions
  # POST /direccions.json
  def create
    @clientes = Cliente.all
    @sucursales = Sucursal.where("cliente_id = ?", params[:direccion][:cliente_id])

    #@direccion = Direccion.new(direccion_params)
    @direccion.sucursal_id =params[:direccion][:sucursal_id]
    @direccion.cliente_id =params[:direccion][:cliente_id]
    respond_to do |format|
      if @direccion.save
        format.html { redirect_to @direccion, notice: 'Direccion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @direccion }
      else
        format.html { render action: 'new',  :layout => "layout_2" }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direccions/1
  # PATCH/PUT /direccions/1.json
  def update
    @clientes = Cliente.all
    @sucursales = @direccion.cliente.sucursals

    respond_to do |format|
      if @direccion.update(direccion_params)
        #@direccion.cliente_id =params[:direccion][:cliente_id]
        #@direccion.sucursal_id =params[:direccion][:sucursal_id]
        @direccion.save!(validate:false)
        format.html { redirect_to @direccion, notice: 'Direccion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direccions/1
  # DELETE /direccions/1.json
  def destroy
    @direccion.destroy
    respond_to do |format|
      format.html { redirect_to direccions_url }
      format.json { head :no_content }
    end
  end

  def maps
    @sucursal = params[:id]
    render :layout => "layout_3"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direccion
      @direccion = Direccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direccion_params
      params.require(:direccion).permit(:sucursal_id, :calle, :numero, :colonia, :delegacion, :cp, :telefono, :referencia, :mapsgoogle, :matriz, :photo, :cliente_id)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
    def load_direccion
      @direccion = Direccion.new(direccion_params)
    end
end
