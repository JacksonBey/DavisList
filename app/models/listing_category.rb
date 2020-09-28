class ListingCategory < ApplicationRecord
    belongs_to :area
    has_many :listings
end
