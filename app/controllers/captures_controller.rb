class CapturesController < ApplicationController
  before_action :set_capture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  #load_and_authorize_resource
  # GET /captures
  # GET /captures.json
  def index
    @capture= Capture.new
    @clientes = Cliente.all #Aqui en el futuro deberé solamente traer los clientes a los que está asociado el operador
    logger.debug @clientes.count
    if params[:id]
      @cliente = Cliente.find(params[:id])
    end
    @captures = Capture.all
    @notification = Notification.new
    dashofintel

  end

  # GET /captures/1
  # GET /captures/1.json
  def show
    @clientes = Cliente.all
  end

  # GET /captures/new
  def new
    @capture = Capture.new
  end

  # GET /captures/1/edit
  def edit
    @clientes = Cliente.all #Aqui en el futuro deberé solamente traer los clientes a los que está asociado el operador
    @cliente = @capture.cliente
    @captures = Capture.all
    @notification = Notification.new
    dashofintel
  end

  # GET /captures/1/consultar
  def consultar
    logger.debug params[:id]
    id=params[:id]=="id" ? (params[:cliente_id]):(params[:id])
    @notification = Notification.new
    @captures = Capture.where(:cliente_id => id)
    @cliente = Cliente.find(id)
    @capture= Capture.new
    @clientes = Cliente.all #Aqui en el futuro deberé solamente traer los clientes a los que está asociado el operador
    @direccion =nil
    @horario =nil
    @contacto=nil
    @forms = []
    @lists = []
    @form1 = Form1.new
    @cliente.forms.count.times{ |n|
      a = n
      case a
        when 0
          @forms.push(Form1.new)
          @lists.push(Form1.all)
        when 1
          @forms.push(Form2.new)
          @lists.push(Form2.all)
        when 2
          @forms.push(Form3.new)
          @lists.push(Form3.all)
        when 3
          @forms.push(Form4.new)
          @lists.push(Form4.all)
        when 4
          @forms.push(Form5.new)
          @lists.push(Form5.all)
        when 5
          @forms.push(Form6.new)
          @lists.push(Form6.all)
        when 6
          @forms.push(Form7.new)
          @lists.push(Form7.all)
        when 7
          @forms.push(Form8.new)
          @lists.push(Form8.all)
        when 8
          @forms.push(Form9.new)
          @lists.push(Form9.all)
        when 9
          @forms.push(Form10.new)
          @lists.push(Form10.all)

      end
    }
    direcciones = Direccion.where(:cliente_id => id, :matriz => true)
    if (direcciones.size > 0)
      @direccion = direcciones[0]
    end

    @horario = Horario.find(@cliente.datosgenerale.horario_id)
    @contacto = Contacto.find(@cliente.datosgenerale.contacto1_id)
    @sucursales = Sucursal.where(:cliente_id => id)
    @products = Product.all
    dashofintel
  end

  # POST /captures
  # POST /captures.json
  def create
    @capture = Capture.new(capture_params)
    @cliente = Cliente.find(params[:cliente_id])
    @clientes = Cliente.all #Aqui en el futuro deberé solamente traer los clientes a los que está asociado el operador
    @direccion =nil
    @horario =nil
    @contacto=nil

    direcciones = Direccion.where(:cliente_id => params[:cliente_id], :matriz => true)
    if (direcciones.size > 0)
      @direccion = direcciones[0]
    end

    @horario = Horario.find(@cliente.datosgenerale.horario_id)
    @contacto = Contacto.find(@cliente.datosgenerale.contacto1_id)
    @sucursales = Sucursal.where(:cliente_id => params[:cliente_id])

    if @cliente.mensaje_configuracion.sucursal
      @capture.sucursal_id = params[:capture][:sucursal_id]
    end
    @capture.cliente_id = params[:cliente_id]
    @capture.usuario_id = current_usuario.id
    #
    respond_to do |format|
      if @capture.save
        #format.html { redirect_to captures_path, notice: 'El registro ha sido creado exitosamente' }
        format.html { redirect_to({ action: 'index', id:@cliente.id }, notice: "El registro ha sido creado exitosamente") }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /captures/1
  # PATCH/PUT /captures/1.json
  def update
    respond_to do |format|
      if @capture.update(capture_params)
        format.html { redirect_to({ action: 'index', id:@capture.cliente_id }, notice: "El registro ha sido actualizado exitosamente") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captures/1
  # DELETE /captures/1.json
  def destroy
    @capture.destroy
    respond_to do |format|
      format.html { redirect_to({ action: 'index', id:@capture.cliente_id }, notice: "La captura ha sido eliminada exitosamente") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture
      @capture = Capture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capture_params
      if !params[:capture][:avisoFecha].nil?
        fecha = Date.strptime(params[:capture][:avisoFecha], '%m/%d/%Y')
        params[:capture][:avisoFecha]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      if !params[:capture][:notificoFecha].nil?
        fecha = Date.strptime(params[:capture][:notificoFecha], '%m/%d/%Y')
        params[:capture][:notificoFecha]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      if !params[:capture][:rllsFecha].nil?
        fecha = Date.strptime(params[:capture][:rllsFecha], '%m/%d/%Y')
        params[:capture][:rllsFecha]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      if !params[:capture][:rteFecha].nil?
        fecha = Date.strptime(params[:capture][:rteFecha], '%m/%d/%Y')
        params[:capture][:rteFecha]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      if !params[:capture][:fechaCirugia].nil?
        fecha = Date.strptime(params[:capture][:fechaCirugia], '%m/%d/%Y')
        params[:capture][:fechaCirugia]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      if !params[:capture][:fechaProcedimiento].nil?
        fecha = Date.strptime(params[:capture][:fechaProcedimiento], '%m/%d/%Y')
        params[:capture][:fechaProcedimiento]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      end
      #params[:capture][:duracionLlamada]='1 12:59:10'
      params.require(:capture).permit(:ticket, :compania, :polizaContrato, :descripcionEmergencia, :identificarSistema, :referencia, :comentariosExtra,
                                      :avisoNombre, :avisoFecha,:avisoHora, :notificoNombre, :notificoFecha, :notificoHora,
                                      :rllsOperador, :rllsFecha, :rllsHora, :tiempoRespuesta, :notificacionLlegadaSitio, :rteOperador,
                                      :rteFecha, :rteHora, :situacionEmergencia, :duracionEmeregencia, :faltaSuministroGas, :tipoLlamada,
                                      :codigo, :horaEnlace, :medioSeEntero, :terminoChat, :razaMascota, :edad, :codigoAcceso,:codigoOrganizador,
                                      :fijoMovil, :telefonoOrigen, :paisOrigino, :localidadOrigino, :motivoDenuncia, :delito, :puestoInvolucrado,
                                      :resultadoEstatus, :emailContacto, :marca, :modelo, :serie, :beneficiario, :contactoBeneficiario, :nombreFiado,
                                      :puestoFiado, :montoReportar, :enlazadaCorrectamente, :intentosEnlace, :duracionLlamada, :origenCodigoGami,
                                      :codigoGami, :tipoEmergencia, :empresaCodigoGami, :nomenclaturaSistema, :personaRecibe, :razonSocial, :rfc,
                                      :ticketCliente, :relacionPaciente, :lugarTumor, :institucionAtiende, :medicoTratante, :programaInteres, :club,
                                      :handicap, :redConecta, :intensidadSenal, :ubicacionFisica, :ipv4, :macAddress, :hotel, :habitacion, :usuario,
                                      :contrasena, :tiempoContrato, :dispositivo, :acuse, :fechaCirugia, :hospital, :cirugia, :especidalidad,
                                      :paciente, :cargoPersona, :telefonoMedico, :equipoEspecial, :telefonoPaciente, :procedimiento, :fechaProcedimiento,
                                      :equipoDetenido, :fianza, :inclusion, :codigoSeguridad, :numeroControl, :lineaValidacion, :tipoPoliza,
                                      :telefonoFiado, :direccionFiado, :lugarFianza, :vendedorFianza, :formaPagoFianza, :audioconferenciaReporta,
                                      :sucursal_id, :cliente_id, :usuario_id, :status)
    end

    def dashofintel
      render :layout => "layout_3"
    end
end
