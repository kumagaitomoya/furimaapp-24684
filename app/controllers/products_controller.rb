class ProductsController < ApplicationController
  def index
  end
end

private

def message_params
  params.require(:message).permit(:content, :image,:category_id).merge(user_id: current_user.id)
end