class CreateIngredientAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_amounts do |t|
      t.integer :numerator
      t.integer :denominator
      t.integer :number
      t.string :amount
      t.references :ingredient, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
