class SessionsController < ApplicationController
    def new
    end
    
    def create
        if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Successfully logged in.'
        else
        redirect_to login_path, notice: 'Invalid email/password combination.'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Successfully logged out.'
    end
end

=begin
def new
end

def create
  user = User.find_by_email(params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Successfully logged in.'
  else
    flash.now[:alert] = 'Invalid email or password.'
    render :new
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_path, notice: 'Logged out.'
end

=end