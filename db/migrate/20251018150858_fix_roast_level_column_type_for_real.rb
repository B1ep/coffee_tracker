class FixRoastLevelColumnTypeForReal < ActiveRecord::Migration[8.0]
  def up
    if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
      # PostgreSQL: Use CAST to convert existing string values to integers
      change_column :coffees, :roast_level, :integer, using: 'roast_level::integer'
    else
      # SQLite: Need to create new column, copy data, drop old, rename
      add_column :coffees, :roast_level_temp, :integer
      execute "UPDATE coffees SET roast_level_temp = CAST(roast_level AS INTEGER)"
      remove_column :coffees, :roast_level
      rename_column :coffees, :roast_level_temp, :roast_level
    end
  end

  def down
    # Allow reverting back to string if needed
    change_column :coffees, :roast_level, :string
  end
end
