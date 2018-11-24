class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, length: { minimum: 3 }

  belongs_to :recipe, optional: true
end
