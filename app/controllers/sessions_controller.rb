class SessionsController < ApplicationController
    def delete
        session.clear
         redirect_to root_path
    end
end
