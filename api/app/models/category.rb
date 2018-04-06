class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :display_name, presence: true
  validates :order, uniqueness: true

  has_many :recipes
end
