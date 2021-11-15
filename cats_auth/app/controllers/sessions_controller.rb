class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        @user.reset_session_token!

        session[:session_token] = session_token

        if @user
            login(@user)
            redirect_to cats_url
        else
            render :new
        end
    end


end