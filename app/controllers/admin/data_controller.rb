class Admin::DataController < ApplicationController
  # HTTP Basic Authentication - First layer of security
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USERNAME', 'blep'),
                                password: ENV.fetch('ADMIN_HTTP_PASSWORD', 'brooklyn-celtics-espresso')

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
      @message = "Successfully imported coffee: #{coffee.name}. Total coffees in database: #{Coffee.count}. Note: Image must be uploaded manually via Edit."
      @status = :success
    rescue => e
      @message = "Error importing data: #{e.message}"
      @status = :error
    end
  end

  def upload_form
    @coffee = Coffee.first
    if @coffee.nil?
      redirect_to admin_import_path, alert: "No coffee found. Please import data first."
    end
  end

  def upload_image
    @coffee = Coffee.first

    if @coffee.nil?
      @message = "No coffee found. Please import data first."
      @status = :error
      render :upload_form
      return
    end

    if params[:image].present?
      @coffee.image.attach(params[:image])
      @message = "Image uploaded successfully!"
      @status = :success
    else
      @message = "No image file selected."
      @status = :error
    end

    render :upload_form
  end
end
