class ChangeRoastLevelToInteger < ActiveRecord::Migration[8.0]
  def change
    # Remove the old column and add a new integer one
    remove_column :coffees, :roast_level, :string
    add_column :coffees, :roast_level, :integer, default: 5
  end
end
