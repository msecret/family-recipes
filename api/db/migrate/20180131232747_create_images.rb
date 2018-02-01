class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :name
      t.string :url
      t.string :text
      t.integer :width_orig
      t.integer :height_orig
      t.integer :width
      t.integer :height
      t.text :alt

      t.timestamps
    end
  end
end
