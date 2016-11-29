class CallsController < ApplicationController
    before_action :authenticate_usuario!
    #before_action :load_call, only: [:create]
    load_and_authorize_resource
    before_action :set_call, only: [:show]

    def index
      @calls = Call.all
      dashboard_4
    end

    def show
      dashboard_4
    end
    def new
      fecha =  DateTime.now()
      respond_to do |format|
        Call.create(start: fecha )
        #format.html { redirect_to captures_consultar_path(6), notice: 'Llamada iniciada: #{fecha} '  }
        format.html { redirect_to :controller=>'captures',:action=>'consultar',:id=>6, notice: 'Llamada iniciada: #{fecha} '  }
        format.json { head :no_content }
      end
    end

=begin
    def new
      @call= Call.new
      dashboard_4
    end
    def edit
      dashboard_4
    end
    def create
      @call = Call.new(call_params)
      respond_to do |format|
        if @call.save
          format.html { redirect_to @call, notice: 'La llamada ha sido creado exitosamente' }
        else
          format.html { render action: 'new', :layout => "layout_2" }
          format.json { render json: @call.errors, status: :unprocessable_entity }
        end
      end
    end
    def update
      respond_to do |format|
        if @call.update(call_params)
          @call.save!
          format.html { redirect_to @call, :notice => 'La llamada ha sido actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit', :layout => "layout_2"}
          format.json { render json: @call.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @call.destroy
      respond_to do |format|
        format.html { redirect_to calls_url, notice: 'La llamada ha sido eliminada exitosamente.'  }
        format.json { head :no_content }

      end
    end
=end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def call_params
    #  params.require(:calls).permit(:start, :end, :information_id)
    #end
    def dashboard_4
      render :layout => "layout_2"
    end
    #def load_call
    #  @call = Call.new(call_params)
    #end
  end

