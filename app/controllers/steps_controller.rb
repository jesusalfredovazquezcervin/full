class StepsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :load_step, only: [:create]
  load_and_authorize_resource
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @steps = Step.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @step = Step.new
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    #@step = Step.new(step_params)
    @step.save
    respond_with(@step)
  end

  def update

    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Paso actualizado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', :layout => "layout_2" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy
    respond_with(@step)
  end

  private
    def set_step
      @step = Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:procedure_id, :name, :detail, :number, :form)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
  def load_step
    @step = Step.new step_params
  end
end
