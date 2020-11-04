class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  validates :image, :name,:status,:price presence: true
  validates :category_id, numericality: { other_than: 1 }
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