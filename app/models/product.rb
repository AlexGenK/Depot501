class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :description, length: { 
    minimum: 10,
    message: 'должно быть подлиннее'
  }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'должен указывать на изображение в формате GIF, JPG или PNG'
  }
end
