class FriendsController < ApplicationController
  def create
  end

  def destroy
    friend = current_user.friends.where(friend_id: params[:id]).first
    friend.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
