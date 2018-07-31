class SessionsController < ApplicationController
    
    # render a login form
    def new
    
    end
    
    # submit login form & start a session
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in!"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There was something wrong with your login information."
            render 'new' 
        end
    end
    
    # log out
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out."
        redirect_to root_path
    end

end