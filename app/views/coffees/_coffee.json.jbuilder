json.extract! coffee, :id, :name, :roaster, :origin, :roast_level, :tasting_notes, :rating, :website_url, :date_tried, :created_at, :updated_at
json.url coffee_url(coffee, format: :json)
