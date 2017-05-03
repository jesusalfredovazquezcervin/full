class ScalingsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_scaling, only: [:create]
  load_and_authorize_resource
  before_action :set_scaling, only: [:show, :edit, :update, :destroy]

  # GET /scalings
  def index
    @scalings = Scaling.all
    dashboard_4
  end

  # GET /scalings/1
  def show
    dashboard_4
  end

  # GET /scalings/new
  def new
    @scaling = Scaling.new
    @datosgenerales = Datosgenerale.where("cliente_id = ?", Cliente.order(:nombre).first.id)
    dashboard_4
  end

  # GET /scalings/1/edit
  def edit
    @datosgenerales = Datosgenerale.where("cliente_id = ?", @scaling.cliente_id)
    dashboard_4
  end

  # POST /scalings
  def create
    @scaling = Scaling.new(scaling_params)

    if @scaling.save
      redirect_to @scaling, notice: 'Scaling was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scalings/1
  def update
    if @scaling.update(scaling_params)
      redirect_to @scaling, notice: 'Scaling was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scalings/1
  def destroy
    @scaling.destroy
    redirect_to scalings_url, notice: 'Scaling was successfully destroyed.'
  end
  def update_datosgenerales
    logger.debug '--------------------'
    logger.debug '  '
    logger.debug 'Entrando a update_datosgenerales'
    logger.debug params
    logger.debug '  '
    logger.debug '--------------------'
    @datosgenerales = Datosgenerale.where(cliente_id: params[:cliente_id])
    respond_to do |format|
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scaling
      @scaling = Scaling.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scaling_params
      params[:scaling][:cliente_id] = params[:cliente_id]
      params[:scaling][:datosgenerale_id] = params[:datosgenerale_id]
      params.require(:scaling).permit(:datosgenerale_id, :name, :cliente_id, :image1)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
  def load_scaling
    @scaling = Scaling.new(scaling_params)
  end
end
