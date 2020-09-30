class AreasController < ApplicationController

    def index
        session[:page] = "/index"
        @areas = Area.all
    end

    def show
        @area = Area.find(params[:id])
    end

end
