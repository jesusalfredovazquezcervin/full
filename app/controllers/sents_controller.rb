class SentsController < ApplicationController
  before_action :set_sent, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sents = Sent.all
    respond_with(@sents)
  end

  def show
    respond_with(@sent)
  end

  def new
    @sent = Sent.new
    respond_with(@sent)
  end

  def edit
  end

  def create
    @sent = Sent.new(sent_params)
    @sent.save
    respond_with(@sent)
  end

  def update
    @sent.update(sent_params)
    respond_with(@sent)
  end

  def destroy
    @sent.destroy
    respond_with(@sent)
  end

  private
    def set_sent
      @sent = Sent.find(params[:id])
    end

    def sent_params
      params.require(:sent).permit(:usuario_id, :information_id, :recipient, :kind)
    end
end
