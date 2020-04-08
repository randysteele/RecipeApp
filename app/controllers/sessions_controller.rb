class SessionsController < ApplicationController

    def home 
        
    end

    def delete
        session.clear
         redirect_to root_path
    end

end
