class ApplicationController < ActionController::Base
    #Helper methods so you can use them throughout class
    helper_method :logged_in?, :current_user

    #C urrent user
    #E nsure_logged_in
    #L login!
    #L logged_in?
    #L ogout

    #Find user by session token 
    def current_user
        @current_user ||= User.find_by(session_token: session[:session])
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def login!(user)
        session[:session] = user.reset_session_token!
    end

    #Check if current user exists
    def logged_in?
        !!current_user
    end

    #Reset session token and set others to nil 
    def logout!
        current_user.reset_session_token!
        @current_user = nil 
        session[:session] = nil
    end

end
