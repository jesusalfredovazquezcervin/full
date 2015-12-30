class Form3sController < ApplicationController
  before_action :set_form3, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @form3s = Form3.all
    respond_with(@form3s)
  end

  def show
    respond_with(@form3)
  end

  def new
    @form3 = Form3.new
    respond_with(@form3)
  end

  def edit
  end

  def create
    @form3 = Form3.new(form3_params)
    @form3.save
    respond_with(@form3)
  end

  def update
    @form3.update(form3_params)
    respond_with(@form3)
  end

  def destroy
    @form3.destroy
    respond_with(@form3)
  end

  private
    def set_form3
      @form3 = Form3.find(params[:id])
    end

    def form3_params
      params.require(:form3).permit(:cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20)
    end
end
