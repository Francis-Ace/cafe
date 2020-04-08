class Product < ApplicationRecord
  belongs_to :category

  validates :name, :description, :price, :quantity, presence: true
  validates :price, numericality: { only_float: true }
  validates :quantity, numericality: { only_integer: true }

  has_one_attached :image
end
