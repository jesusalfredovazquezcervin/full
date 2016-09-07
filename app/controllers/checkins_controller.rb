class CheckinsController < ApplicationController
  before_action :authenticate_usuario!
  load_and_authorize_resource
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]




  def index
    @checkins = Checkin.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @checkin = Checkin.new
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.save
    dashboard_4
  end

  def update
    @checkin.update(checkin_params)
    dashboard_4
  end

  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to checkins_path, notice: "Registro eliminado exitosamente" }
      format.json { head :no_content }
    end
  end
  def checkin
    respond_to do |format|
      Checkin.create(usuario: current_user, checkin: Time.now, kind: Checkin::KIND[0])
      format.html { redirect_to root_path, notice: 'Asistencia registrada exitosamente.'  }
      format.json { head :no_content }
    end
  end
  def checkout
      Checkin.create(usuario: current_user, checkin: Time.now, kind: Checkin::KIND[1])
      sign_out_and_redirect(current_user)
  end

  private
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    def checkin_params
      params[:checkin][:usuario_id] = current_user.id
      params[:checkin][:checkin] = Date.today
      params.require(:checkin).permit(:usuario_id, :checkin, :kind)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
end
