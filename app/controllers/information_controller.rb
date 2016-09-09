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
    dashofintel
  end

  def new
    @information = Information.new
    respond_with(@information)
  end

  def edit
    @clientes = Cliente.all
    @current_user = current_user
    @user = current_user
    dashofintel
  end

  def create
    @cuenta = Datosgenerale.find(params[:cuenta_id])
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
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
        format.html { redirect_to({controller: "captures" , action: 'index', id:@information.datosgenerale_id }, notice: "El registro ha sido actualizado exitosamente") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_3" }
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
          when "Datetime"
            @information.attributes.each_key.select{|k| k.to_s == fld}.empty? ? nil:(@information.attributes = {fld => @information.attributes[fld].nil? ? ( nil):(@information.attributes[fld].to_datetime)}  )
        end
      }
      @information.save



    end

    def information_params
      #Este codigo sirve para la pantalla de Edit del registro. Verifica que venga un parametro fieldX y lo agrega a params[information]
=begin
      if !@information.nil?
        @information.attributes.count.times{|i|
          field = ("field" << i.to_s).next
          if !params[field.to_sym].nil?
            params[:information][field.to_sym] = params[:field3]["field3(1i)".to_sym] << "-" << params[:field3]["field3(2i)".to_sym] << "-" << params[:field3]["field3(3i)".to_sym]
          end
        }
      end
=end



#Todo: Verificar que este codigo sirva para mas de 1 control de tipo date y que no truene cuando vienen vacios
      #Este codigo sirve para convertir una fecha que viene de la pantalla de alta
      fields=Hash.new
      fieldsDelete = []
      params[:information].each_with_index { |p, i|
        if !(/(\di)/ =~ p.to_s).nil?
          fieldsDelete.push p[0]
          key=p[0].slice(0,p[0].length-4)
          if fields[key.to_sym].nil?
            fields[key.to_sym] = p[1]
          else
            fields[key.to_sym] = fields[key.to_sym] << "-" << p[1]
          end

        end
      }
      fields.each_pair{|k,v|
        r = v.split("-").reverse!

        params[:information][k] = (r[0] << "-" << r[1] << "-" << r[2]).to_date


      }
      fieldsDelete.each{|d|
        params[:information].delete d
      }
      params[:information][:usuario_id] = current_user.id
      if !params[:form_id].nil?
        params[:information][:form_id] = params[:form_id]
      end
      if params[:action] == "update"
        params[:information][:datosgenerale_id] = @information.datosgenerale_id
      end
      params.require(:information).permit(:form_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15, :field16, :field17, :field18, :field19, :field20, :datosgenerale_id)
    end
    def dashofintel
      render :layout => "layout_3"
    end
    def load_information
      @information = Information.new(information_params)
    end
end
