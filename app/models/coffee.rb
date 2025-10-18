class Coffee < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :roaster, presence: true
  validates :origin, presence: true
  validates :date_tried, presence: true
  validates :rating, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :roast_level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :website_url, presence: true
  validates :tasting_notes, presence: true
  validates :image, presence: true

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
