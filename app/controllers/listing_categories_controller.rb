class ListingCategoriesController < ApplicationController
    
    def index
        @listing_categories = ListingCategory.all
    end

    def show
        @listing_category = ListingCategory.find(params[:id])
    end

end
