class FixCooksRecipesRelation < ActiveRecord::Migration[5.0]
  def change
    rename_column(:recipes_cooks, :cooks_id, :cook_id)
    rename_column(:recipes_cooks, :recipes_id, :recipe_id)
    rename_table(:recipes_cooks, :cooks_recipes)
  end
end
