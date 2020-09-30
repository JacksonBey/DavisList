class ApplicationController < ActionController::Base
    
    before_action :fetch_user
    before_action :save_my_previous_url
    helper_method :fetch_user
    helper_method :logged_in?

    def logged_in?
        !!session[:user_id]
    end

    def fetch_user
        @logged_in = logged_in?
        if @logged_in
            @user = User.find(session[:user_id])
        else
            redirect_to new_login_path
        end
    end

    def log_out!
        session.delete(:user_id)
    end

    def save_my_previous_url
        #session[:my_previous_url] = URI(request.referer || '').path
        session[:my_previous_url] = URI(request.original_url).path
        # byebug
        # if session[:my_previous_url] == "/login/new"
        #     session[:my_previous_url] = "area/index"
        # end
    end

end
