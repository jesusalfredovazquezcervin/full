class AgendasController < ApplicationController
  before_action :authenticate_usuario!
  #load_and_authorize_resource
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @agendas = Agenda.all
    respond_with(@agendas, :layout => "layout_2")
  end

  def show
    respond_with(@agenda,:layout => "layout_2")
  end

  def new
    @agenda = Agenda.new
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    @agenda = Agenda.new(agenda_params)
    #@agenda.save
    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, notice: 'El Cliente ha sido agregado exitosamente a la agenda' }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @agenda.update(agenda_params)
    respond_with(@agenda)
  end

  def destroy
    @agenda.destroy
    respond_with(@agenda, :layout => "layout_2")
  end

  private
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    def agenda_params
      params.require(:agenda).permit(:cliente_id, :nombre, :rfc, :calle, :numero, :colonia, :delegacion, :estado, :cp, :email, :telefono, :cel)
    end

    def dashboard_4
      render :layout => "layout_2"
    end
end
