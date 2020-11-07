class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
    if current_user == @product.user
     @product.destroy
    else
     redirect_to root_path 
  end
    end

  private

  def product_params
    params.require(:product).permit(:name, :status, :image, :price, :category_id, :shipping_charge_id, :shipping_day_id, :shipping_area_id, :condition_id).merge(user_id: current_user.id)
  end
end

def set_product
  @product = Product.find(params[:id])
end

# | Column              | Type       | Options                       |
# | ----------------    | ---------- | ----------------------------- |
# | user                | references | null: false,foreign_key: true |
# | name                | string     | null: false                   |
# | status              | text       | null: false                   |
# | price               | integer    | null: false                   |
# | category_id         | integer    | null: false                   |
# | shipping_charges_id | integer    | null: false                   |
# | shipping_days_id    | integer    | null: false                   |
# | shipping_area_id    | integer    | null: false                   |
# | condition_id        | integer    | null: false                   |
