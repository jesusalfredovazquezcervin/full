class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @selected_form_id
    id=0
    if params[:id] == "id"
      if !params[:form_id].to_s.empty?
        id=params[:form_id]
      end
    elsif !params[:id].to_s.empty?
      id = params[:id]
    end

    if id == 0
      @fields = Field.all
    else
      @selected_form_id = id
      @fields = Field.where(:form_id =>  id)
    end

    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @field = Field.new
    @field.form_id = params[:id]
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    @field = Field.new(field_params)
    respond_to do |format|
      if @field.save
        format.html { redirect_to @field, notice: 'El Campo ha sido creado exitosamente' }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @field.update(field_params)
    respond_with(@field)
  end

  def destroy
    @field.destroy
    respond_with(@field)
  end

  private
    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      if !(params[:field][:data_type] == "List")
        params[:field][:list]=nil
      end
      params.require(:field).permit(:form_id, :name, :data_type, :mandatory, :show_in_list, :behave, :list)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
