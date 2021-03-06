class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user  
    end

    def require_user
        if !logged_in?
            flash[:alert] = "Musisz być zalogowany, aby wykonać tą akcję"
            redirect_to administracja_path
        end
    end
end
