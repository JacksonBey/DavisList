class ListingsController < ApplicationController
    
    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
        @comments = @listing.comments
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.create(listing_params)
        redirect_to @listing
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :description, :price, :area_id, :user_id, :listing_category_id)
    end
end
