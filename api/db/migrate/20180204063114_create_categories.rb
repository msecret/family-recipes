class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :display_name
      t.integer :order
      t.string :icon_name

      t.timestamps
    end
  end
end
