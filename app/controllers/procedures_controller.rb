class ProceduresController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_procedure, only: [:create]
  load_and_authorize_resource
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
    @datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.order(:nombre).first.id).order(:account)
    dashboard_4
  end

  def update_datosgenerales
    @datosgenerales = Cliente.find(params[:cliente_id]).datosgenerales.order(:account)
    respond_to do |format|
      format.js
    end
  end

  def edit
    @clientes = Cliente.order(:nombre).all
    @datosgenerales = Datosgenerale.where("cliente_id = ?", @procedure.cliente_id ).order(:account)
    dashboard_4
  end

  def create
    #@procedure = Procedure.new(procedure_params)
    @clientes = Cliente.all.order(:nombre)
    respond_to do |format|
      if @procedure.save
        save_procedure_accounts(@procedure.id)
        format.html { redirect_to @procedure, notice: 'Procedimiento ha sido creado exitosamente' }
        format.json { render action: 'show', status: :created, location: @procedure }
      else
        format.html { render action: 'new',  :layout => "layout_2" }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @procedure.update(procedure_params)
    save_procedure_accounts(params[:id])
    respond_with(@procedure)
  end

  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    def save_procedure_accounts(procedure_id)
      ProcedureAccount.where(procedure_id: params[:id]).each{|c| c.destroy}
      params[:accounts].each{|a|
        ProcedureAccount.create(procedure_id: procedure_id, datosgenerale_id: a) unless ProcedureAccount.where(procedure_id: procedure_id, datosgenerale_id: a).exists?
      }
    end

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def procedure_params
      params.require(:procedure).permit(:cliente_id, :sucursal_id, :name, :deliver, :number)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
  def load_procedure
    @procedure = Procedure.new procedure_params
  end
end
