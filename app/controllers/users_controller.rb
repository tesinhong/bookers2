class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
       flash[:notice] = "successfully updated!"
       redirect_to user_path(current_user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end


# {"id"=>"5"}
# {"book" => {"title"=>"aaaaaa", name}}
