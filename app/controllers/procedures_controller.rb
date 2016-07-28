class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @procedures = Procedure.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @procedure = Procedure.new
    @clientes = Cliente.all.order(:nombre)
    @datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.order(:nombre).first.id)
    dashboard_4
  end

  def update_datosgenerales
    @datosgenerales = Cliente.find(params[:cliente_id]).datosgenerales
    respond_to do |format|
      format.js
    end
  end

  def edit
    @clientes = Cliente.order(:nombre).all
    @datosgenerales = Datosgenerale.where("cliente_id = ?", @procedure.cliente_id )
    dashboard_4
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.save
    respond_with(@procedure)
  end

  def update
    @procedure.update(procedure_params)
    respond_with(@procedure)
  end

  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def procedure_params
      params.require(:procedure).permit(:cliente_id, :sucursal_id, :name, :deliver, :number, :datosgenerale_id)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
