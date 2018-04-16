class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :image
  belongs_to :category
  has_and_belongs_to_many :cooks
end
