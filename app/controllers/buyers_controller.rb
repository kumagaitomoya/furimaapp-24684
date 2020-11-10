class BuyersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  
  def index
    @user_product = UserProduct.new
    
    
     if current_user.id == @product.user_id || @product.buyer.present?
       redirect_to root_path
     else
      render action: :index
     end
  end

  def new
  end

  def create
    @user_product = UserProduct.new(product_params)
    if @user_product.valid?
      pay_product
      @user_product.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def product_params
    params.require(:user_product).permit(:postal_code, :municipality, :address, :phone_namber, :buiding_name, :shipping_area_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: product_params[:token],
      currency: 'jpy'
    )
  end
end

def set_product
  @product = Product.find(params[:id])
end

