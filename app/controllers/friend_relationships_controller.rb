class FriendRelationshipsController < ApplicationController
  def create
    @user = User.find(params[:friend_relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to user_show_path(@user)
  end

  def destroy
    @user = FriendRelationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to user_show_path(@user)
  end
end
