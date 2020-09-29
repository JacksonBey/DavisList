class Area < ApplicationRecord
    has_many :users
    has_many :listing_categories
    has_many :listings, through: :listing_categories

    validates :name, presence: true
end
