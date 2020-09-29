class ListingsController < ApplicationController
    
    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
        @comments = @listing.comments
        @comment = Comment.new
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.create(listing_params)
        if @listing.valid?
            redirect_to @listing
        else
            flash[:errors] = @listing.errors.full_messages
            redirect_to new_listing_path
        end
    end

    private

    def listing_params
        params.require(:listing).permit( :title, :description, :price, :user_id, :listing_category_id)
    end
end
