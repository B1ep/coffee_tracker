class Coffee < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :roaster, presence: true
  validates :rating, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    less_than_or_equal_to: 10 
  }
  
  ROAST_LEVELS = ['light', 'medium', 'medium-dark', 'dark'].freeze
end
