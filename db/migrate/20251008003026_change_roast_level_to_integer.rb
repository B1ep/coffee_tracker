class ChangeRoastLevelToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :coffees, :roast_level, :integer, using: 'roast_level::integer'
  end
end
