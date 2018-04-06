class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.datetime :preparation_time
      t.datetime :cooking_time
      t.text :memorandums
      t.integer :difficulty
      t.text :story
      t.text :ingredients
      t.string :description
      t.string :main_photo_url

      t.belongs_to :image
      t.belongs_to :category, index: true

      t.timestamps
    end

    create_table :recipes_cooks, id: false do |t|
      t.belongs_to :cooks, index: true
      t.belongs_to :recipes, index: true
    end
  end
end
