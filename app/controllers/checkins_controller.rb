class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @checkins = Checkin.all
    respond_with(@checkins)
  end

  def show
    respond_with(@checkin)
  end

  def new
    @checkin = Checkin.new
    respond_with(@checkin)
  end

  def edit
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.save
    respond_with(@checkin)
  end

  def update
    @checkin.update(checkin_params)
    respond_with(@checkin)
  end

  def destroy
    @checkin.destroy
    respond_with(@checkin)
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
end
