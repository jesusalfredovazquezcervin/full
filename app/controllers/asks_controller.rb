class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asks = Ask.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @ask = Ask.new
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    @ask = Ask.new(ask_params)
    @ask.save
    respond_with(@ask)
  end

  def update
    @ask.update(ask_params)
    respond_with(@ask)
  end

  def destroy
    @ask.destroy
    respond_with(@ask)
  end

  private
    def set_ask
      @ask = Ask.find(params[:id])
    end

    def ask_params
      fecha = Date.strptime(params[:ask][:answer_date], '%m/%d/%Y')
      params[:ask][:answer_date]="#{fecha.year}-#{fecha.month}-#{fecha.day}"
      params[:ask][:usuario_id] = current_user.id
      params.require(:ask).permit(:cliente_id, :usuario_id, :question, :asked_by, :answer, :answer_by, :answer_date, :voting, :subject)
    end
    def dashboard_4
      render :layout => "layout_2"
    end
end
