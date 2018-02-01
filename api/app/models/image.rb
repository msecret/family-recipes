class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, length: { minimum: 3 }
end
