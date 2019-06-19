class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user
      log_in @user
     # session[:user_id] = @user.id
      redirect_to @user
    else
      render "new"
    end
  end

  def destroy
    log_out(current_user)
    redirect_to login_path
  end

 
  

  private

    def log_in(user)
      session[:user_id] = user.id
      current_user = user
    end
  
    def log_out(user)
      if user == current_user
        session.delete(:user_id)
      end
    end
    

end
