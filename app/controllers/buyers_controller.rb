class BuyersController < ApplicationController
  def index
    @user_product = UserProduct.new
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @user_product = UserProduct.new (product_params)
    if  @user_product.valid?
      # binding.pry
      pay_product
       @user_product.save
       redirect_to action: :index
     end
  end

  private 

  def product_params
  params.require(:user_product).permit(:postal_code, :municipality, :address, :phone_namber, :buiding_name,:shipping_area_id,).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  
      card: product_params[:token],    
      currency: 'jpy'                
    )
  end
end

