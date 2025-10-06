class CreateCoffees < ActiveRecord::Migration[8.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :roaster
      t.string :origin
      t.string :roast_level
      t.text :tasting_notes
      t.integer :rating
      t.string :website_url
      t.date :date_tried

      t.timestamps
    end
  end
end
