class HorariosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_horario, only: [:create]
  load_and_authorize_resource
  before_action :set_horario, only: [:show, :edit, :update, :destroy]


  # GET /horarios
  # GET /horarios.json
  def index
    @horarios = Horario.all
    dashboard_4
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
    dashboard_4
  end

  # GET /horarios/new
  def new
    @horario = Horario.new
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

  # GET /horarios/1/edit
  def edit
    @clientes = Cliente.all
    @sucursales = @horario.cliente.sucursals
    dashboard_4
  end

  # POST /horarios
  # POST /horarios.json
  def create
    #@horario = Horario.new(horario_params)
    @horario.cliente_id = params[:horario][:cliente_id]
    @horario.sucursal_id= params[:horario][:sucursal_id]
    respond_to do |format|
      if @horario.save
        format.html { redirect_to @horario, notice: 'Horario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @horario }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        @horario.cliente_id = params[:horario][:cliente_id]
        @horario.sucursal_id= params[:horario][:sucursal_id]
        @horario.save!
        format.html { redirect_to @horario, notice: 'Horario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to horarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:nombre, :lunhini, :lunhfin, :marhini, :marhfin, :miehini, :miehfin, :juehini, :juehfin, :viehini, :viehfin, :sabhini, :sabhfin, :domhini, :domhfin, :cliente_id, :sucursal_id)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
  def load_horario
    @horario = Horario.new(horario_params)
  end
end
