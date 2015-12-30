class Form2sController < ApplicationController
  before_action :set_form2, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @form2s = Form2.all
    respond_with(@form2s)
  end

  def show
    respond_with(@form2)
  end

  def new
    @form2 = Form2.new
    respond_with(@form2)
  end

  def edit
  end

  def create
    @form2 = Form2.new(form2_params)
    @form2.save
    respond_with(@form2)
  end

  def update
    @form2.update(form2_params)
    respond_with(@form2)
  end

  def destroy
    @form2.destroy
    respond_with(@form2)
  end

  private
    def set_form2
      @form2 = Form2.find(params[:id])
    end

    def form2_params
      params.require(:form2).permit(:cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20)
    end
end
