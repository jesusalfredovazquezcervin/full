class AgendasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_agenda, only: [:create]
  load_and_authorize_resource
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
    @clientes = Cliente.all.order(:nombre)
    @datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.order(:nombre).first.id)
    dashboard_4
  end

  def edit
    @clientes = Cliente.order(:nombre).all
    @datosgenerales = Datosgenerale.where("cliente_id = ?", @agenda.cliente_id )
    dashboard_4
  end

  def create
    #@agenda = Agenda.new(agenda_params)
    @clientes = Cliente.all.order(:nombre)
    respond_to do |format|
      if @agenda.save
        save_agenda_accounts(@agenda.id )
        format.html { redirect_to @agenda, notice: 'El Cliente ha sido agregado exitosamente a la agenda' }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @agenda.update(agenda_params)
    save_agenda_accounts(params[:id])
    respond_with(@agenda)
  end

  def destroy
    @agenda.destroy
    respond_with(@agenda, :layout => "layout_2")
  end
  def update_datosgenerales
    @datosgenerales = Cliente.find(params[:cliente_id]).datosgenerales
    respond_to do |format|
      format.js
    end
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

    def save_agenda_accounts(agenda_id)
      AgendaAccount.where(agenda_id: params[:id]).each{|c| c.destroy}
      params[:accounts].each{|a|
        AgendaAccount.create(agenda_id: agenda_id, datosgenerale_id: a) unless AgendaAccount.where(agenda_id: agenda_id, datosgenerale_id: a).exists?
      }
    end
    def load_agenda
      @agenda = Agenda.new(agenda_params)
    end
end
