class ChangeRatingToDecimalInCoffees < ActiveRecord::Migration[8.0]
  def change
    change_column :coffees, :rating, :decimal, precision: 3, scale: 1
  end
end
