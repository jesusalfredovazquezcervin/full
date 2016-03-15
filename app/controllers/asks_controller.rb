class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asks = Ask.all
    respond_with(@asks)
  end

  def show
    respond_with(@ask)
  end

  def new
    @ask = Ask.new
    respond_with(@ask)
  end

  def edit
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
      params.require(:ask).permit(:cliente_id, :usuario_id, :question, :asked_by, :answer, :answer_by, :answer_date, :voting, :subject)
    end
end
