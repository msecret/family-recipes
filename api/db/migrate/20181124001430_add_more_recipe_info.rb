class AddMoreRecipeInfo < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :cooking_time, :string
    add_column :recipes, :serves, :integer
  end
end
