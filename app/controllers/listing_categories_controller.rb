class ListingCategoriesController < ApplicationController
    
    skip_before_action :fetch_user, only: [:index, :show]
    
    def index
        @listing_categories = ListingCategory.all
    end

    def show
        @listing_category = ListingCategory.find(params[:id])
    end

end
