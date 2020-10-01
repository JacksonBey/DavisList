class AreasController < ApplicationController

    skip_before_action :fetch_user

    def index
        session[:page] = "/index"
        @areas = Area.all
    end

    def show
        @area = Area.find(params[:id])
    end

      # <body>
  #   <% if logged_in? %>
  #   <p>You are currently logged in as: <%= link_to User.find_by(id: session[:user_id]).name, user_path(session[:user_id]) %></p>
  #   <%= button_to "Log out", log_out_path, method: :delete %>
  #   <%else%>
  #   <%= link_to "Log in", new_login_path %>
  #   <%= link_to "Sign up", new_user_path %>
  # <%end%>

end
