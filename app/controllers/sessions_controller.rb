class SessionsController < ApplicationController

  def new
# code
  end
  def create
    user=User.find_by(email:params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
                                 session[:user_id] = user.id
                                 flash[:success]="You have successfully Logged in"
                                 redirect_to user_path(user)
    else
      flash.now[:danger]= "There are something wrong with your login information"

      render 'new'
  end
  end
  def destroy
    session[:user_id]=nil
    flash[:success]='You have been Logged Out ! Get Lost :-]'
    redirect_to root_path
  end
end
