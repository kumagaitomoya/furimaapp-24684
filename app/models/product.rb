class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  validates :image, :name, :status, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :condition_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_charges_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_days_id, numericality: { other_than: 1, message: 'Select' }
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
