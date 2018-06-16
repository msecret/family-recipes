class AddAmountTypeToIngredientAmounts < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredient_amounts, :unit, :string
  end
end
