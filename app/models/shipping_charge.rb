class ShippingCharges < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, name: '送料込み（出品者負担）' }
  ]
end
# アクティブハッシュの最後の2行目を削除する
# アクティブハッシュのクラス名とアソシエーションのところの記述をかける
