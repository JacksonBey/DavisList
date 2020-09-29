class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :listing_categories
  has_many :comments
  has_many :users, through: :comments
end
