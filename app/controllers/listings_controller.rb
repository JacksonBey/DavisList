class ListingsController < ApplicationController
    skip_before_action :save_my_previous_url, only: [:new, :edit, :create, :update]

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
        fetch_user
        @listing = Listing.create(listing_params)
        if @listing.valid?
            redirect_to @listing
        else
            flash[:errors] = @listing.errors.full_messages
            redirect_to new_listing_path
        end
    end

    def edit
        fetch_user
        if sessions[:user_id] == @listing.user.id
            redirect_to edit_listing_path(@listing)
        else
            redirect_to new_login_path
        end    
    end

    def update
        @listing.update(listing_params)
        if @listing.valid?
            redirect_to listing_path(@listing.listing_path)
        else
            flash[:errors] = @listing.errors.full_messages
            redirect_to edit_listing_path(@listing)
        end
    end

    private

    def listing_params
        params.require(:listing).permit( :title, :description, :price, :user_id, :listing_category_id)
    end
end
