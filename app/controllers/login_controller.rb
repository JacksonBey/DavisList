class LoginController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user=User.find_by(name: params(:name))
        if @user and @user.authenticate(params[:password])
        else
            redirect_to 
        end
    end

end
