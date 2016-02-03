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
    dashboard_4
  end

  def edit
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
      params.require(:procedure).permit(:cliente_id, :sucursal_id, :name)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
