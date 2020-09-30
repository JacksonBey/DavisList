class LoginController < ApplicationController

    def new
        @user = User.new
    end

    def create
        byebug
        @user=User.find_by(params[:name])
        if @user and @user.authenticate(params[:password])
            redirect_to session[:my_previous_url]
        else
            redirect_to new_login_path
        end
    end

    def destroy
        log_out!
        redirect_to new_login_path
    end

end
