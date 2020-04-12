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
        binding.pry
        
    end
end
