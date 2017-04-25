class InformationController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_information, only: :create
  load_and_authorize_resource
  before_action :set_information, only: [:show, :edit, :update, :destroy], except: :resend_mail


  respond_to :html
  def index
    @information = Information.all
    respond_with(@information)
  end

  def show
    @clientes = Cliente.all
    @current_user = current_user
    @user = current_user
    dashboard
  end

  def new
    @information = Information.new
    respond_with(@information)
  end

  def edit
    @clientes = Cliente.all
    @current_user = current_user
    @user = current_user
    dashboard
  end

  def create
    @cuenta = Datosgenerale.find(params[:cuenta_id])
    #@information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        #asociamos llamada con informacion
        call = Call.find params[:information][:call_id]
        call.information_id = @information.id
        call.end = DateTime.now
        call.save!
        #Enviamos correo
        send_mail(params[:recipient].select{|r| r unless r.empty?}.join(", "),@information,"Send") if (@information.form.procedure.deliver and !params[:recipient].nil? )
        format.html { redirect_to({ controller:"captures", action: 'index', id:@cuenta.id }, notice: "El registro ha sido creado exitosamente") }
      else
        format.html { render action: 'new', :layout => "layout_2" }
      end
    end

  end

  def update
    #@information.update(information_params)
    #dashofintel

    respond_to do |format|
      if @information.update(information_params)
        if current_usuario.role='admin'
          format.html { redirect_to @information, notice: 'El registro capturado fue modificado correctamente.' }
          format.json { head :no_content }
        else
          format.html { redirect_to({controller: "captures" , action: 'index', id:@information.datosgenerale_id }, notice: "El registro ha sido actualizado exitosamente") }
          format.json { head :no_content }
        end

      else
        if current_usuario.role = 'admin'
          format.html { render action: 'edit', :layout => "layout_2" }
        else
          format.html { render action: 'edit', :layout => "layout_3" }
        end
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to({controller: "captures" , action: 'index', id:@information.datosgenerale_id}, alert: "El registro ha sido eliminado exitosamente") }
      format.json { head :no_content }
    end
  end

  def resend_mail
    information = Information.find_by_id params[:information][:id]
    send_mail(params[:recipient].select{|r| r unless r.empty?}.join(", "),information,"Resend") if (information.form.procedure.deliver and !params[:recipient].nil? )
    respond_to do |format|
      format.html { redirect_to({ controller:"captures", action: 'index', id:information.datosgenerale_id}, notice: "El registro ha sido re-enviado exitosamente") }
    end
  end

  def send_mail(recipient, information, type)
    InformationMailer.daily(recipient, information.id).deliver
    Sent.create(usuario: current_user, information: information, recipient: recipient, kind: type)
  end

  private
    def set_information
      @information = Information.find(params[:id])
            @information.form.fields.order(:id).all.each_with_index { |f, i|
        fld = "field" + (i+1).to_s
        case f.data_type
          when "Date"
            @information.attributes.each{|a|
              logger.debug a
            }

            @information.attributes.each_key.select{|k| k.to_s == fld}.empty? ? nil:(@information.attributes = {fld => @information.attributes[fld].nil? ? ( nil):(@information.attributes[fld].to_date)}  )

        end
      }
      @information.save



    end

    def information_params
      #Barremos los parametros de information para buscar tiempo, si lo hay entonces se lo agregamos al field correspondiente
      params[:information].each{|p|
        if !(/field\d{1,2}_time/ =~ p.to_s).nil?

          time = p[1]
          fld = p[0][0.. p[0].length-6]
          params[:information][fld.to_sym] = params[:information][fld.to_sym] << ' ' << time
        end
      }


      if !params[:form_id].nil?
        params[:information][:form_id] = params[:form_id]
      end
      if params[:action] == "update"
        params[:information][:datosgenerale_id] = @information.datosgenerale_id
        params[:information][:userupdate_id] = current_user.id
        params[:information][:updated_at] = DateTime.now
      end
      if params[:action] == "create"
        params[:information][:datosgenerale_id] = params[:cuenta_id]
        params[:information][:usuario_id] = current_user.id
      end
      params.require(:information).permit(:form_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15, :field16, :field17, :field18, :field19, :field20, :datosgenerale_id, :userupdate_id)
    end

    def dashboard
      if current_usuario.role = 'admin'
        render :layout => "layout_2"
      else
        render :layout => "layout_3"
      end

    end

    def load_information
      @information = Information.new(information_params)
    end
end
