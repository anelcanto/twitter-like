class ApplicationController < ActionController::Base
    
    private
    
    def authenticate
        unless current_user
            redirect_to root_path, alert: "Invalid request"
        end
    end
    
    def login(user)
        session[:user_id] = user.id
    end
    def logout
        session[:user_id] = nil
    end
    
    def current_user
        # @current_user ||= User.find session[:user_id] if session[:user_id]
        if @current_user
            @current_user
        elsif session[:user_id]
            @current_user = User.find session[:user_id]
        end
    end
    
    helper_method :current_user
end
