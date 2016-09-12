class NotificationsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_notification, only: [:create]
  load_and_authorize_resource
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @notifications = Notification.all
    respond_with(@notifications)
  end

  def show
    respond_with(@notification)
  end

  def new
    @notification = Notification.new
    if params[:id]
      @cuenta = Datosgenerale.find_by_id params[:id]
      @notification.cliente_id = @cuenta.cliente_id
      @notification.datosgenerale_id = params[:id]
      @cuentas = @cuenta.cliente.datosgenerales.all.order(:account).collect{|account| [" " << account.cliente.nombre << "   |    " << account.account << "    |    " << account.frase , account.id]}.sort
    else
      @cuenta=nil
    end
    @user=current_user
    dashboard_4
  end

  def edit
    @cliente = @notification.cliente
    @clientes = Cliente.all
    @cuenta = Datosgenerale.find_by_id params[:cuenta_id]
    @user = current_user
    @cuentas = @cuenta.cliente.datosgenerales.all.order(:account).collect{|account| [" " << account.cliente.nombre << "   |    " << account.account << "    |    " << account.frase , account.id]}.sort
    dashboard_4
  end

  def create
    #@notification = Notification.new(notification_params)
    @cuenta = Datosgenerale.find_by_id params[:cuenta_id]
    @notification.cliente = @cuenta.cliente
    @notification.datosgenerale = @cuenta
    @cuentas = @cuenta.cliente.datosgenerales.all.order(:account).collect{|account| [" " << account.cliente.nombre << "   |    " << account.account << "    |    " << account.frase , account.id]}.sort
    respond_to do |format|
      if @notification.save
        format.html { redirect_to({ controller:"captures",  action: 'index', id:params[:cuenta_id] }, notice: "Notificacion creada exitosamente") }
      else
        format.html { render action: 'new', :layout => "layout_3" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cuenta = Datosgenerale.find_by_id params[:cuenta_id]
    @cuentas = @cuenta.cliente.datosgenerales.all.order(:account).collect{|account| [" " << account.cliente.nombre << "   |    " << account.account << "    |    " << account.frase , account.id]}.sort
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to({ controller:"captures",  action: 'index', id:@notification.datosgenerale_id }, notice: "Notificacion modificada exitosamente") }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to({ controller:"captures",  action: 'index', id:@notification.datosgenerale_id }, notice: "Notificacion eliminada exitosamente") }
     end
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      if !params[:notification].nil?
        if !params[:notification][:startdate].nil?
          start = Date.strptime(params[:notification][:startdate], '%m/%d/%Y')
          params[:notification][:startdate]="#{start.year}-#{start.month}-#{start.day}"
        end
        if !params[:notification][:starttime].nil?
          startTime = Time.strptime(params[:notification][:starttime], '%H:%M')
        else
          startTime = Time.strptime('00:00', '%H:%M')
        end
        if !params[:notification][:duedate].nil?
          due = Date.strptime(params[:notification][:duedate], '%m/%d/%Y')
          params[:notification][:duedate]="#{due.year}-#{due.month}-#{due.day}"
        end
        if !params[:notification][:duetime].nil?
          dueTime = Time.strptime(params[:notification][:duetime], '%H:%M')
        else
          dueTime = Time.strptime('00:00', '%H:%M')
        end


        if !params[:notification][:startdate].nil? and !params[:notification][:starttime].nil?
          #params[:notification][:startdatetime] = params[:notification][:startdate] << " " << params[:notification][:starttime]
          #params[:notification][:startdatetime] = "2015-12-01 14:33:45"
          params[:notification]["startdatetime(1i)"]=start.year.to_s
          params[:notification]["startdatetime(2i)"]=start.month.to_s
          params[:notification]["startdatetime(3i)"]=start.day.to_s
          params[:notification]["startdatetime(4i)"]=startTime.hour.to_s
          params[:notification]["startdatetime(5i)"]=startTime.min.to_s
        end
        if !params[:notification][:duedate].nil? and !params[:notification][:duetime].nil?
          #params[:notification][:duedatetime] = params[:notification][:duedate] << " " << params[:notification][:duetime]
          #params[:notification][:duedatetime] = "2015-12-01 13:32:22"
          params[:notification]["duedatetime(1i)"]=due.year.to_s
          params[:notification]["duedatetime(2i)"]=due.month.to_s
          params[:notification]["duedatetime(3i)"]=due.day.to_s
          params[:notification]["duedatetime(4i)"]=dueTime.hour.to_s
          params[:notification]["duedatetime(5i)"]=dueTime.min.to_s
        end


        params.require(:notification).permit(:cliente_id, :sucursal_id, :usuario_id, :person_id, :recipient_id, :status_id, :event_id, :notification, :startdate, :starttime, :duedate, :duetime, :startdatetime, :duedatetime)
      end
    end
    def dashboard_4
      render :layout => "layout_3"
    end
    def load_notification
      @notification = Notification.new(notification_params)
    end
end
