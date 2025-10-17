class Admin::DataController < ApplicationController
  before_action :authenticate_admin

  def import
    # Check if data already exists
    if Coffee.count > 0
      @message = "Data already exists! Found #{Coffee.count} coffee(s) in database."
      @status = :warning
      return
    end

    # Coffee data to import
    coffee_data = {
      name: "Murang'a Kayu AA",
      roaster: "Archetype",
      origin: "Kenya",
      roast_level: "7",
      tasting_notes: "Blood orange and caramel notes strong, great smooth cup for pourover",
      rating: 9,
      website_url: "https://drinkarchetype.com/products/kenya-muranga?variant=41729374650431",
      date_tried: nil,
      created_at: "2025-10-06 20:43:21.009526",
      updated_at: "2025-10-10 15:17:40.989821"
    }

    begin
      coffee = Coffee.create!(coffee_data)
      @message = "Successfully imported coffee: #{coffee.name}. Total coffees in database: #{Coffee.count}"
      @status = :success
    rescue => e
      @message = "Error importing data: #{e.message}"
      @status = :error
    end
  end
end
