class Form4sController < ApplicationController
  before_action :set_form4, only: [:show, :edit, :update, :destroy]
  before_action :set_fields, only: [:show, :edit]

  respond_to :html

  def index
    @form4s = Form4.all
    dashofintel
  end

  def show
    @nameForm = @form4.cliente.forms[3].name
    @clientes = Cliente.all
    dashofintel
  end

  def new
    @form4 = Form4.new
    dashofintel
  end

  def edit
    @clientes = Cliente.all
    @nameForm = @form4.cliente.forms[3].name
    dashofintel
  end

  def create
    @form4 = Form4.new(form4_params)
    @cliente = Cliente.find(params[:cliente_id])
    @clientes = Cliente.all
    logger.debug @clientes.count
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

    respond_to do |format|
      if @form4.save
        format.html { redirect_to({ controller:"captures", action: 'index', id:@cliente.id }, notice: "El registro ha sido creado exitosamente") }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @form4.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    respond_to do |format|
      if @form4.update(form4_params)
        format.html { redirect_to({controller: "captures" , action: 'index', id:@form4.cliente_id }, notice: "El registro ha sido actualizado exitosamente") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_3" }
        format.json { render json: @form4.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form4.destroy
    respond_to do |format|
      format.html { redirect_to({controller: "captures" , action: 'index', id:@form4.cliente_id }, notice: "El registro ha sido eliminado exitosamente") }
      format.json { head :no_content }
    end
  end

  private
  def set_form4
    @form4 = Form4.find(params[:id])
  end

  def set_fields
    @fields
    if @form4.cliente.forms.count > 0
      @fields = @form4.cliente.forms[3].fields
    end
  end
  def form4_params
    fields=Hash.new
    fieldsDelete = []
    params[:form4].each_with_index { |p, i|
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
      params[:form4][k] = r[0] << "-" << r[1] << "-" << r[2]
    }
    fieldsDelete.each{|d|
      params[:form4].delete d
    }
    params[:form4][:usuario_id] = current_user.id
    if params[:action] == "create"
      params[:form4][:cliente_id] = params[:cliente_id]
    end

    params.require(:form4).permit(:cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20)
  end
  def dashofintel
    render :layout => "layout_3"
  end
end
