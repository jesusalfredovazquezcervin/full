class SucursalsController < ApplicationController
  before_action :set_sucursal, only: [:show, :edit, :update, :destroy]

  # GET /sucursals
  # GET /sucursals.json
  def index
    @sucursals = Sucursal.all
    dashboard_4
  end

  # GET /sucursals/1
  # GET /sucursals/1.json
  def show
    dashboard_4
  end

  # GET /sucursals/new
  def new
    @sucursal = Sucursal.new
    dashboard_4
  end

  # GET /sucursals/1/edit
  def edit
    dashboard_4
  end

  # POST /sucursals
  # POST /sucursals.json
  def create
    @sucursal = Sucursal.new(sucursal_params)
    if(params[:post][:cliente_id] != "")
      @sucursal.cliente_id = params[:post][:cliente_id]
    end
    if(params[:post][:contacto_id] != "")
      @sucursal.contacto_id = params[:post][:contacto_id]
    end
    if (params[:post][:recepcionista_id] != "")
      @sucursal.recepcionista_id = params[:post][:recepcionista_id]
    end
    if(params[:post][:contactoprincipal_id] != "")
      @sucursal.contactoprincipal_id = params[:post][:contactoprincipal_id]
    end
    if (params[:post][:contactosecundario_id] != "")
      @sucursal.contactosecundario_id = params[:post][:contactosecundario_id]
    end
    respond_to do |format|
      if @sucursal.save
        format.html { redirect_to @sucursal, notice: 'Sucursal was successfully created.' }
        format.json { render action: 'show', :layout => "layout_2", status: :created, location: @sucursal }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1
  # PATCH/PUT /sucursals/1.json
  def update
    respond_to do |format|
      if @sucursal.update(sucursal_params)
        if(params[:post][:cliente_id] != "")
          @sucursal.cliente_id = params[:post][:cliente_id]
        end
        if(params[:post][:contacto_id] != "")
          @sucursal.contacto_id = params[:post][:contacto_id]
        end
        if (params[:post][:recepcionista_id] != "")
          @sucursal.recepcionista_id = params[:post][:recepcionista_id]
        end
        if(params[:post][:contactoprincipal_id] != "")
          @sucursal.contactoprincipal_id = params[:post][:contactoprincipal_id]
        end
        if (params[:post][:contactosecundario_id] != "")
          @sucursal.contactosecundario_id = params[:post][:contactosecundario_id]
        end

        @sucursal.save!

        format.html { redirect_to @sucursal, notice: 'Sucursal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursals/1
  # DELETE /sucursals/1.json
  def destroy
    @sucursal.destroy
    respond_to do |format|
      format.html { redirect_to sucursals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sucursal_params
      params.require(:sucursal).permit(:cliente_id, :nombre, :telefono, :contacto_id, :recepcionista_id, :contactoprincipal_id, :contactosecundario_id)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
end
