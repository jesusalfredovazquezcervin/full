class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def update_procedures
    @procedures = Cliente.find(params[:cliente_id]).procedures
    respond_to do |format|
      format.js
    end
  end

  def index
    @forms = Form.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @form = Form.new
    @procedures= Procedure.where("cliente_id = ?", Cliente.first.id)
    dashboard_4
  end

  def edit
    @procedures= @form.cliente.procedures
    dashboard_4
  end

  def create
    @form = Form.new(form_params)
    @procedures= Procedure.where("cliente_id = ?", params[:form][:cliente_id])
    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'El Formulario ha sido creado exitosamente' }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    @procedures= @form.cliente.procedures
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, :notice => 'El Formulario ha sido actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2"}
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'El Formulario ha sido eliminado exitosamente.'  }
      format.json { head :no_content }

    end
  end

  private
    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name, :cliente_id, :procedure_id)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
