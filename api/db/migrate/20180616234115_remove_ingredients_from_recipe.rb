class RemoveIngredientsFromRecipe < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :ingredients
  end
end
