class DatosgeneralesController < ApplicationController
  before_action :set_datosgenerale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  #load_and_authorize_resource

  # GET /datosgenerales
  # GET /datosgenerales.json
  def index
    @datosgenerales = Datosgenerale.all
    dashboard_4
  end

  # GET /datosgenerales/1
  # GET /datosgenerales/1.json
  def show
    dashboard_4
  end

  # GET /datosgenerales/new
  def new
    @datosgenerale = Datosgenerale.new
    @clientes = Cliente.all
    @contactos = Contacto.where("cliente_id = ?", Cliente.first.id)
    @horarios = Horario.where("cliente_id = ?", Cliente.first.id)
    dashboard_4
  end

  def update_contactos
    @contactos= Contacto.where("cliente_id = ?", params[:cliente_id])
    respond_to do |format|
      format.js
    end
  end
  def update_horarios
    @horarios = Horario.where("cliente_id = ?", params[:cliente_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /datosgenerales/1/edit
  def edit

    @contactos_ids=[]

    if(@datosgenerale.contacto1_id.nil? == false)
      @contactos_ids.push(@datosgenerale.contacto1_id)
    end
    if(@datosgenerale.contacto2_id.nil? == false)
      @contactos_ids.push(@datosgenerale.contacto2_id)
    end
    if(@datosgenerale.contacto3_id.nil? == false)
      @contactos_ids.push(@datosgenerale.contacto3_id)
    end
    if(@datosgenerale.contacto4_id.nil? == false)
      @contactos_ids.push(@datosgenerale.contacto4_id)
    end
    if(@datosgenerale.contacto5_id.nil? == false)
      @contactos_ids.push(@datosgenerale.contacto5_id)
    end

    @contactos= Contacto.where("cliente_id = ?", @datosgenerale.cliente_id)
    @horarios = Horario.where("cliente_id = ?", @datosgenerale.cliente_id)
    @clientes = Cliente.all
    dashboard_4
  end

  # POST /datosgenerales
  # POST /datosgenerales.json
  def create
    @clientes = Cliente.all
    @contactos = Contacto.where("cliente_id = ?", Cliente.first.id)
    @horarios = Horario.where("cliente_id = ?", Cliente.first.id)
    @datosgenerale = Datosgenerale.new(datosgenerale_params)
    @datosgenerale.cliente_id = params[:datosgenerale][:cliente_id]

    @datosgenerale.contacto1_id = nil
    @datosgenerale.contacto2_id = nil
    @datosgenerale.contacto3_id = nil
    @datosgenerale.contacto4_id = nil
    @datosgenerale.contacto5_id = nil


    params[:datosgenerale][:contacto1_id].each_index { |i|
      case i
        when 1
          @datosgenerale.contacto1_id = params[:datosgenerale][:contacto1_id][i]
        when 2
          @datosgenerale.contacto2_id = params[:datosgenerale][:contacto1_id][i]
        when 3
          @datosgenerale.contacto3_id = params[:datosgenerale][:contacto1_id][i]
        when 4
          @datosgenerale.contacto4_id = params[:datosgenerale][:contacto1_id][i]
        when 5
          @datosgenerale.contacto5_id = params[:datosgenerale][:contacto1_id][i]
        else
          #do default case
      end

    }


    @datosgenerale.horario_id = params[:post][:horario_id]
    #@datosgenerale.alta = Date.strptime(params[:datosgenerale][:alta], '%m/%d/%Y')
    if(params[:datosgenerale][:tipocambio]=='1')
      @datosgenerale.tipocambio=true
    else
      @datosgenerale.tipocambio=false
    end

    respond_to do |format|
      if @datosgenerale.save
        format.html { redirect_to @datosgenerale, notice: 'Datosgenerale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @datosgenerale }
      else
        format.html { render action: 'new', :layout => "layout_2"}
        format.json { render json: @datosgenerale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datosgenerales/1
  # PATCH/PUT /datosgenerales/1.json
  def update
    respond_to do |format|
      @clientes = Cliente.all
      @contactos = Contacto.where("cliente_id = ?", Cliente.first.id)
      @horarios = Horario.where("cliente_id = ?", Cliente.first.id)

      if @datosgenerale.update(datosgenerale_params)
        @datosgenerale.cliente_id = params[:datosgenerale][:cliente_id]

        @datosgenerale.contacto1_id = nil
        @datosgenerale.contacto2_id = nil
        @datosgenerale.contacto3_id = nil
        @datosgenerale.contacto4_id = nil
        @datosgenerale.contacto5_id = nil

        params[:datosgenerale][:contacto1_id].each_index { |i|
          case i
            when 1
              @datosgenerale.contacto1_id = params[:datosgenerale][:contacto1_id][i]
            when 2
              @datosgenerale.contacto2_id = params[:datosgenerale][:contacto1_id][i]
            when 3
              @datosgenerale.contacto3_id = params[:datosgenerale][:contacto1_id][i]
            when 4
              @datosgenerale.contacto4_id = params[:datosgenerale][:contacto1_id][i]
            when 5
              @datosgenerale.contacto5_id = params[:datosgenerale][:contacto1_id][i]
            else
              #do default case
          end

        }
        @datosgenerale.horario_id = params[:post][:horario_id]

        #@datosgenerale.alta = Date.parse(params[:datosgenerale][:alta], "%m/%d/%Y") #=> {:year=>2001, :mon=>2, :mday=>3}
        #@datosgenerale.alta = Date.strptime(params[:datosgenerale][:alta], '%m/%d/%Y')
        if(params[:datosgenerale][:tipocambio]=='1')
          @datosgenerale.tipocambio=true
        else
          @datosgenerale.tipocambio=false
        end
        @datosgenerale.save!
        format.html { redirect_to @datosgenerale, notice: 'Datosgenerale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @datosgenerale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datosgenerales/1
  # DELETE /datosgenerales/1.json
  def destroy
    @datosgenerale.destroy
    respond_to do |format|
      format.html { redirect_to datosgenerales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datosgenerale
      @datosgenerale = Datosgenerale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datosgenerale_params
      fecha = Date.strptime(params[:datosgenerale][:alta], '%m/%d/%Y')
      params[:datosgenerale][:alta]="#{fecha.year}-#{fecha.month}-#{fecha.day}"

      fecha = Date.strptime(params[:datosgenerale][:start], '%m/%d/%Y')
      params[:datosgenerale][:start]="#{fecha.year}-#{fecha.month}-#{fecha.day}"

      params.require(:datosgenerale).permit(:alta, :actualizacion, :clavesalida, :locacion, :did, :telenrutados, :contacto1_id, :contacto2_id, :contacto3_id, :contacto4_id, :contacto5_id, :telefono1, :telefono2, :telefono3, :telefono4, :telefono5, :fax, :giro, :procedimiento, :paginaweb, :cliente_id, :horario_id, :tipocambio, :pedido, :frase, :start, :periodicity, :recipient)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
end
