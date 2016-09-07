class ProductsController < ApplicationController
  before_action :authenticate_usuario!
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    dashboard_4
  end

  def show
    dashboard_4
  end

  def new
    @product = Product.new
    dashboard_4
  end

  def edit
    dashboard_4
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Producto creado satisfactoriamente.' }
        format.json { render action: 'show', :layout => "layout_2", status: :created, location: @product }
      else
        format.html { render action: 'new', :layout => "layout_2" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:reference, :code, :description, :magnitude, :magnitude_description, :price, :price_by_kg, :usability, :category, :measure, :cliente_id, :presentation, :brand)
    end
  def dashboard_4
    render :layout => "layout_2"
  end
end
