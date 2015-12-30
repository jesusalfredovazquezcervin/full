class Form1sController < ApplicationController
  before_action :set_form1, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @form1s = Form1.all
    respond_with(@form1s)
  end

  def show
    respond_with(@form1)
  end

  def new
    @form1 = Form1.new
    respond_with(@form1)
  end

  def edit
  end

  def create
    @form1 = Form1.new(form1_params)
    @form1.save
    respond_with(@form1)
  end

  def update
    @form1.update(form1_params)
    respond_with(@form1)
  end

  def destroy
    @form1.destroy
    respond_with(@form1)
  end

  private
    def set_form1
      @form1 = Form1.find(params[:id])
    end

    def form1_params
      fields=Hash.new
      fieldsDelete = []
      params[:form1].each_with_index { |p, i|
        if !(/(\di)/ =~ p.to_s).nil?
          fieldsDelete.push p[0]
          key=p[0].slice(0,p[0].length-4)
          if fields[key.to_sym].nil?
            fields[key.to_sym] = p[1]
          else
            fields[key.to_sym] = fields[key.to_sym] << "-" << p[1]
          end

        end
      }
      fields.each_pair{|k,v|
        r = v.split("-").reverse!
        params[:form1][k] = r[0] << "-" << r[1] << "-" << r[2]
      }
      fieldsDelete.each{|d|
        params[:form1].delete d
      }
      params.require(:form1).permit(:cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20)
    end
end
