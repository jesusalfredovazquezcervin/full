class StepsController < ApplicationController
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
    @step = Step.new(step_params)
    @step.save
    respond_with(@step)
  end

  def update
    @step.update(step_params)
    respond_with(@step)
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
      params.require(:step).permit(:procedure_id, :name, :detail, :number)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
