class UserProduct
  include ActiveModel::Model
  attr_accessor :postal_code,:municipality,:address,:buiding_name,:phone_namber,:shipping_area_id,:user_id,:product_id,:token
  with_options presence: true  do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    # 郵便番号
    validates :municipality
    # 市区町村
    validates :address
    # 番地
    validates :phone_namber,format: { with: /\A\d{11}\z/, message: 'Input only number' }
    # 電話番号
    validates :token
  end

  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
  # 都道府県

  def save
    buyer = Buyer.create(product_id: product_id, user_id: user_id)
    Address.create(postal_code: postal_code, municipality: municipality, address:address, phone_namber: phone_namber, buiding_name: buiding_name,shipping_area_id: shipping_area_id, buyer_id:buyer.id )
  end

end



