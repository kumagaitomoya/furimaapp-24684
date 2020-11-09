class BuyersController < ApplicationController
  def index
    @user_product = UserProduct.new
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @user_product = UserProduct.new (product_params)
    # if  @user_product.valid?
    #   @user_product.save
    #   redirect_to action: :index
    # else
    #   render action: :new
    # end
  end

  private 

  def product_params
  params.require(:user_product).permit(:postal_code, :municipality, :address, :phone_namber, :buiding_name,:shipping_area_id,).merge(user_id: current_user.id,product_id: params[:product_id])
  end

end

