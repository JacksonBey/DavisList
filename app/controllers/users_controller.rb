class UsersController < ApplicationController

    skip_before_action :save_my_previous_url, only: [:new, :create]
    skip_before_action :fetch_user, only: [:new, :create, :show]

    def new
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password2]
            @user = User.create(user_params)
            if @user.valid?
                session[:user_id] = @user.id
                redirect_to session[:my_previous_url]
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to new_user_path
            end
        else
            flash[:errors] = ["Password must match"]
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        if params[:user][:password] == params[:user][:password2]
            @user.update(user_params)
            if @user.valid?
                redirect_to @user
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to edit_user_path(@user)
            end
        else
            flash[:errors] = ["Password must match"]
            redirect_to edit_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :bio, :area_id)  
    end

end
