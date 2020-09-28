class ListingsController < ApplicationController
    
    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing.create = Listing(listing_params)
        redirect_to @listing
    end

    private

    def listing_params
        params.permit(:listing).require(:title, :description, :price, :area_id, :user_id, :listing_category_ids =>[])
    end
end
