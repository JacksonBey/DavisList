class LoginController < ApplicationController

    skip_before_action :save_my_previous_url, only: [:new, :create, :destroy]
    skip_before_action :fetch_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:name])

        if @user and @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            session[:my_previous_url] ||= "/area/index"
            redirect_to session[:my_previous_url]
        elsif @user == nil
            flash[:errors] = "Non-existent Account"
            redirect_to new_login_path
        else
            flash[:errors] = "Incorrect Password" 
            redirect_to new_login_path
        end
    end

    def destroy
        log_out!
        redirect_to session[:my_previous_url]
    end

end
