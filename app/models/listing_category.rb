class ListingCategory < ApplicationRecord
    belongs_to :area
    has_many :listings

    validates :name, presence: true

    def area_name
        self.area.name
    end

    def order_listings
        self.listings.order('created_at DESC')
    end

    def listing_amount
        self.listings.count
    end
end
