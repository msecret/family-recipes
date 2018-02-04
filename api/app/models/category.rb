class Category < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :order, uniqueness: true
end
