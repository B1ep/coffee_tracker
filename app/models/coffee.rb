class Coffee < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :roaster, presence: true
  validates :rating, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1, 
    less_than_or_equal_to: 10 
  }
  validates :roast_level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  
  # Helper method to convert number to text
  def roast_level_text
    case roast_level
    when 1..3
      "Light"
    when 4..6
      "Medium"
    when 7..10
      "Dark"
    else
      "Medium"
    end
  end
end
