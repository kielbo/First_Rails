class UsersController < ApplicationController
before_action :set_user,only:[:edit,:update,:show] #wykonaj akcje set user przed metodami edit update, show // dzieki temu nasza zmienna @user jest gotowa do uzycia tzn wypełniona odpowiednimi danymi
def index
  @users=User.paginate(page:params[:page], per_page:5)
end
def new
  @user=User.new(user_params)
  if @user.save
    flash[:succes]="Welcome to alpha blog #{@user.username}"
    redirect_to articles_path
  else
    render'new'
  end
end

def create
    @user=User.new(user_params)
    if @user.save
      flash[:succes]= "Welcome to to the Alpha Blog #{@user.username} "
      redirect_to articles_path
    else
      render 'new'
    end

end

def edit
end

def update
  if @user.update(user_params)
    flash[:succes]="Your account was updated successfully"
    redirect_to articles_path
  else
    render 'edit'
  end
end


def show
  @user_articles= @user.articles.paginate(page:params[:page],per_page:5)
end


private
def user_params
  params.require(:user).permit(:username,:email,:password)
end 
def set_user
  @user = User.find(params[:id])
end
end
