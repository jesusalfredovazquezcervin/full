class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @information = Information.all
    respond_with(@information)
  end

  def show
    respond_with(@information)
  end

  def new
    @information = Information.new
    respond_with(@information)
  end

  def edit
  end

  def create
    @cliente = Cliente.find(params[:cliente_id])
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
          format.html { redirect_to({ controller:"captures", action: 'index', id:@cliente.id }, notice: "El registro ha sido creado exitosamente") }
      else
        format.html { render action: 'new', :layout => "layout_2" }
      end
    end

  end

  def update
    @information.update(information_params)
    respond_with(@information)
  end

  def destroy
    @information.destroy
    respond_with(@information)
  end

  private
    def set_information
      @information = Information.find(params[:id])
    end

    def information_params
      params[:information][:usuario_id] = current_user.id
      params[:information][:form_id] = params[:form_id]
      params.require(:information).permit(:form_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10)
    end
end
