class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :listing_category
  has_many :comments
  has_many :users, through: :comments
end
