class SessionsController < ApplicationController
    def delete
        session.clear
         redirect_to root_path
    end

    def create 
        user = User.find_by(username: params[:user][:email])
        if user && user.authenticate(params[:user][:email])
        session[:user_id] = :user_id
        redirect_to user_path(user)
        else
            flash[:message] = "The information you entered is incorrect, please try again"
            redirect_to login_path
        end
    end

    def google       
      #  binding.pry  
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/'
          end
    end

private
    def auth 
        request.env['omniauth.auth']
    end

end
