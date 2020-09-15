class SessionsController < ApplicationController

    def create 
        user = User.find_by(username: params[:user][:username])
        # Fix this issue of a user not being able to login
        if user && user.authenticate(params[:user][:password])
        session[:user_id] = user_id
        redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def google   
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(9)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/'
          end
    end

    def destroy
        session.clear
         redirect_to root_path
    end

private
    def auth 
        request.env['omniauth.auth']
    end

end
