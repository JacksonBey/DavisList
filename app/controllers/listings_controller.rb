class ListingsController < ApplicationController
    def new
        @listing = Listing.new
    end

    def create
        @listing.create = Listing(listing_params)
        redirect_to @listing
    end

    private

    def listing_params
        params.permit(:listing).require(:title, :description, :price, :area_id, :user_id, :category_ids => [])
    end
end
