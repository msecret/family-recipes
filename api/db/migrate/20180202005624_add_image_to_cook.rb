class AddImageToCook < ActiveRecord::Migration[5.0]
  def change
    add_reference :cooks, :image, foreign_key: true
  end
end
