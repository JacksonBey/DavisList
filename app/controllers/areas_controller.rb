class AreasController < ApplicationController

    skip_before_action :fetch_user

    def index
        session[:page] = "/index"
        @areas = Area.all
    end

    def show
        @area = Area.find(params[:id])
    end

end
