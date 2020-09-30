class UsersController < ApplicationController

    skip_before_action :save_my_previous_url, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to session[:my_previous_url]
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :bio, :area_id)  
    end

end
