class FixCooksImageRelation < ActiveRecord::Migration[5.0]
  def change
    add_reference :cooks, :image, foreign_key: true
    remove_reference :images, :cook, foreign_key: true
  end
end
