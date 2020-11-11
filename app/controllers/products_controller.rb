class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show,]

  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @product.user_id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy if current_user.id == @product.user.id
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :status, :image, :price, :category_id, :shipping_charge_id, :shipping_day_id, :shipping_area_id, :condition_id).merge(user_id: current_user.id)
  end


 def set_product
  @product = Product.find(params[:id])
 end

end


