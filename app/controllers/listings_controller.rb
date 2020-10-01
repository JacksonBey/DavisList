class ListingsController < ApplicationController

    skip_before_action :save_my_previous_url, only: [:new, :edit, :create, :update]
    skip_before_action :fetch_user, only: [:index, :show]

    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
        @comments = @listing.comments
        @comment = Comment.new
        if logged_in?
            @user = User.find(session[:user_id])
        end
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

    def edit
        # if session[:user_id] == @listing.user.id
        #     redirect_to edit_listing_path(@listing)
        # else
        #     redirect_to new_login_path
        # end  
        @listing = Listing.find(params[:id])  
    end

    def update
        @listing = Listing.find(params[:id])  
        @listing.update(listing_params)
        if @listing.valid?
            redirect_to @listing
        else
            flash[:errors] = @listing.errors.full_messages
            redirect_to edit_listing_path(@listing)
        end
    end

    def destroy
        @listing = Listing.find(params[:format])
        @category = @listing.listing_category
        @listing.destroy
        redirect_to @category
    end

    private

    def listing_params
        params.require(:listing).permit( :title, :description, :price, :user_id, :listing_category_id)
    end
end
