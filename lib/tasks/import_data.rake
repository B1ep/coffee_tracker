namespace :db do
  desc "Import coffee data from SQLite to PostgreSQL"
  task import_from_sqlite: :environment do
    puts "Starting data import..."

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

    coffee = Coffee.create!(coffee_data)
    puts "Successfully imported coffee: #{coffee.name}"
    puts "Total coffees in database: #{Coffee.count}"
  end
end
