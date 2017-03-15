class ReportsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_report, only: [:create]
  load_and_authorize_resource
  before_action :set_report, only: [:show, :edit, :update, :destroy, :sent, :query, :send_query_report, :edit_query, :show_query, :show_report]


  respond_to :html

  def sent
    #PERIODICITY = %w[diario semanal quincenal mensual bimestral trimestral semestral anual]
    #SCHEDULE = %w[matutino verspertino nocturno]
    #@today = @report.send_same_day ? (Date.strptime(params[:date], "%Y%m%d")):(Date.strptime(params[:date], "%Y%m%d") - 1.day)

    #revisamos si el usuario esta asociado al reporte


    if (@report.contactos.select{|x| x == current_usuario.contacto }.count > 0) or (current_usuario.role == 'Admin' or current_usuario.role == 'Supervisor')

      @today = Date.strptime(params[:date], "%Y%m%d")
      case @report.periodicity
        when "diario"
          date_start = @today - 1.day
          @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
          @fi = DateTime.new(@today.year , @today.month, @today.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
        when "semanal"
          date_start = @today - 1.week
        when "quincenal"
          date_start = @today - 2.weeks
        when "mensual"
          date_start = @today - 1.month
        when "bimestral"
          date_start = @today - 2.months
        when "trimestral"
          date_start = @today - 3.months
        when "semestral"
          date_start = @today - 6.months
        when "anual"
          date_start = @today - 1.year
        when "varios_dias"
          if params[:days].nil?
            diff_days = (@report.end_day.to_date - @report.start_day.to_date).to_i
          else
            diff_days = params[:days].to_i
          end
          date_start = @today - diff_days.day

      end
      if @report.periodicity != "diario"
        #if today.day == @report.end_day.day
          @fi = DateTime.new(date_start.year , date_start.month, date_start.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
          @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
        #end
      end
      #@information = @report.form.informations.where("created_at >= ? AND created_at <= ?", @fi, @ff)
      @information = @report.form.informations.created_between(@fi, @ff)

      if current_usuario.role == 'Admin' or current_usuario.role == 'Supervisor'
        render :layout => 'layout_2'
      else
        render :layout => 'empty'
      end
    else

      sign_out_and_redirect(current_usuario)
      flash[:alert] = "No tiene acceso a este reporte"
    end

  end



  def query

    if (@report.cliente.contactos.select{|x| x == current_usuario.contacto }.count > 0) or current_usuario.role == 'Admin' or current_usuario.role == 'Supervisor'


      @fi = @report.start_day
      @ff = @report.end_day
      @information = @report.form.informations.created_between(@fi, @ff)
      if current_usuario.role == 'Admin' or current_usuario.role == 'Supervisor'
        render :layout => 'layout_2'
      else
        render :layout => 'empty'
      end
    else

      sign_out_and_redirect(current_usuario)
      flash[:alert] = "No tiene acceso a este reporte"
    end

  end

  def index
    @reports = Report.no_temp
    dashboard_4
  end
  def customize
    @reports = Report.temp
    dashboard_4
  end
  def show
    dashboard_4
  end

  def new
    @report= Report.new
    @clientes = Cliente.all.order(:nombre)
    cliente = Cliente.all.order(:nombre).first
    @datosgenerales = Datosgenerale.where("cliente_id = ?", cliente.id)
    @contactos = cliente.contactos
    @forms = Form.where(procedure_id: cliente.procedures.collect{|p| p.id})
    dashboard_4
  end

  def edit
    @clientes = Cliente.order(:nombre).all
    cliente = Cliente.find_by_id @report.cliente_id
    @datosgenerales = Datosgenerale.where("cliente_id = ?", cliente.id )
    @contactos = cliente.contactos
    @forms = Form.where(procedure_id: cliente.procedures.collect{|p| p.id})
    dashboard_4
  end

  def create
    #@report = Report.new(report_params)
    @clientes = Cliente.all.order(:nombre)
    cliente = Cliente.all.order(:nombre).first
    @contactos = cliente.contactos
    @forms = Form.where(procedure_id: cliente.procedures.collect{|p| p.id})
    respond_to do |format|
      if @report.save
        save_report_accounts @report.id
        save_report_recipients @report.id
        format.html { redirect_to @report, notice: 'Reporte creado satisfactoriamente.' }
        format.json { render action: 'show', :layout => "layout_2", status: :created, location: @report }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @report.update(report_params)
    save_report_accounts params[:id]
    save_report_recipients params[:id]
    respond_with(@report)
  end

  def destroy
    @report.destroy
    respond_with(@report)
  end
  def update_datosgenerales
    cliente = Cliente.find_by_id params[:cliente_id]
    @datosgenerales = cliente.datosgenerales
    respond_to do |format|
      format.js
    end
  end
  def update_contactos
    cliente = Cliente.find_by_id params[:cliente_id]
    @contactos =  cliente.contactos
    respond_to do |format|
      format.js
    end
  end
  def update_forms
    cliente = Cliente.find_by_id params[:cliente_id]
    @forms =  cliente.forms
    @flag = true
    respond_to do |format|
      format.js
    end
  end
  def new_query
    @report= Report.new
    @clientes = Cliente.all.order(:nombre)
    cliente = Cliente.all.order(:nombre).first
    @datosgenerales = Datosgenerale.where("cliente_id = ?", cliente.id)
    @contactos = cliente.contactos
    @forms = Form.where(procedure_id: cliente.procedures.collect{|p| p.id})
    dashboard_4
  end
  def edit_query
    @clientes = Cliente.all.order(:nombre)
    cliente = Cliente.find_by_id @report.cliente_id
    @datosgenerales = Datosgenerale.where("cliente_id = ?", cliente.id)
    @contactos = cliente.contactos
    @forms = Form.where(procedure_id: cliente.procedures.collect{|p| p.id})
    dashboard_4
  end
  def show_query
    dashboard_4
  end

  def generate
    @report = Report.new(report_params)
    @report.temp= true
    @report.periodicity = 'varios_dias'
    @report.schedule = 'nocturno'
    @report.save!
    respond_to do |format|
      format.html { redirect_to({ controller:'reports', action: 'query',  id: @report.id }) }
    end
  end
  def send_query_report
    InformationMailer.send_query_report(params[:recipient].join(',') , @report).deliver
    ReportSent.create(report_id: @report.id, sent_by: current_usuario.email, sent_to: params[:recipient].join(','))
    respond_to do |format|
      if params[:listado] == 'true'
        format.html { redirect_to(report_customize_path ,notice: "El reporte ha sido enviado exitosamente") }
      else
        format.html { redirect_to({ controller:'reports', action: 'query',  id: @report.id },notice: "El reporte ha sido enviado exitosamente") }
      end

    end
  end
  def send_report
    InformationMailer.send_query_report(params[:recipient].join(',') , @report).deliver
    ReportSent.create(report_id: @report.id, sent_by: current_usuario.email, sent_to: params[:recipient].join(','))
    respond_to do |format|
      if params[:listado] == 'true'
        format.html { redirect_to(reports_path ,notice: "El reporte ha sido enviado exitosamente") }
      else
        format.html { redirect_to({ controller:'reports', action: 'show_report',  id: @report.id },notice: "El reporte ha sido enviado exitosamente") }
      end

    end
  end

  def show_report
    logger.debug 'Entrando al metodo report_show_report'
    #@report = Report.find_by_id report_id
    @today = @report.send_same_day ? (Date.today):(Date.today - 1.day)
    case @report.periodicity
      when "diario"
        date_start = @today - 1.day
        @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
        @fi = DateTime.new(@today.year , @today.month, @today.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
      when "semanal"
        date_start = @today - 1.week
      when "quincenal"
        date_start = @today - 2.weeks
      when "mensual"
        date_start = @today - 1.month
      when "bimestral"
        date_start = @today - 2.months
      when "trimestral"
        date_start = @today - 3.months
      when "semestral"
        date_start = @today - 6.months
      when "anual"
        date_start = @today - 1.year
      when "varios_dias"
        diff_days = (@report.end_day.to_date - @report.start_day.to_date).to_i
        date_start = @today  - diff_days.day
    end
    if @report.periodicity != "diario"
      @fi = DateTime.new(date_start.year , date_start.month, date_start.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
      @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
    end


    respond_to do |format|
      format.html { redirect_to({ controller:'reports', action: 'sent',  id: @report.id.to_s, date: @today.strftime("%Y%m%d")},notice: "El reporte ha sido generado exitosamente") }
    end
    #@enlace = url_for(controller: "reports", action: "sent", id: @report.id.to_s, date: @today.strftime("%Y%m%d"))

  end

  private
  def set_report
    @report = Report.find_by_id params[:id]
  end

  def report_params
    if ! params[:report].nil?
      fecha1 = Date.strptime(params[:report][:start_day], '%m/%d/%Y')
      hora1 = Time.parse(params[:report][:start_time])
      datetime1 = DateTime.new fecha1.year, fecha1.month, fecha1.day, hora1.hour, hora1.min, hora1.sec
      params[:report][:start_day]= datetime1.strftime("%Y-%m-%d %H:%M:%S")

      fecha2 = Date.strptime(params[:report][:end_day], '%m/%d/%Y')
      hora2 = Time.parse(params[:report][:end_time])
      datetime2 = DateTime.new fecha2.year, fecha2.month, fecha2.day, hora2.hour, hora2.min, hora2.sec
      params[:report][:end_day]= datetime2.strftime("%Y-%m-%d %H:%M:%S")

      params.require(:report).permit(:id, :recipient, :periodicity, :schedule, :form_id, :cliente_id, :start_day, :end_day,:name, :send_same_day, :active)

    end

  end

  def dashboard_4
    render :layout => "layout_2"
  end
  def save_report_accounts(report_id)
    ReportAccount.where(report_id: params[:id]).each{|c| c.destroy}
    params[:accounts].each{|a|
      ReportAccount.create(report_id: report_id, datosgenerale_id: a) unless ReportAccount.where(report_id: report_id, datosgenerale_id: a).exists?
    }
  end
  def save_report_recipients(report_id)
    ReportRecipient.where(report_id: params[:id]).each{|c| c.destroy}
    params[:recipients].each{|r|
      ReportRecipient.create(report_id: report_id, contacto_id: r) unless ReportRecipient.where(report_id: report_id, contacto_id: r).exists?
    }
  end
  def load_report
    @report = Report.new report_params
  end
end
