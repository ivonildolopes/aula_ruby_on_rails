class ApplicationController < ActionController::Base

    include SessionsHelper

    private 
        def require_logged_in_user
            flash[:danger] = 'Area restrita, por favor realize o Login'
            redirect_to login_path
        end

end
