class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  
  validates :image, :name,:status,:price,presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
end



# Image can't be blank 完了
# Name can't be blank　完了
# Info can't be blank　完了
# Price can't be blank　完了
# Price Half-width number 
# Price Out of setting range
# Category Select
# Sales status Select
# Shipping fee status Select
# Prefecture Select
# Scheduled delivery Select