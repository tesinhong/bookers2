class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = "ユーザーのフォローに成功しました"
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
      resirect_to user_path(current_user.id)
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "ユーザーのフォロー解除に失敗しました"
      redirect_to user_path(current_user.id)
    end
  end

  private
  
  def set_user
    user = User.find(params[:follow_id])
  end
end
