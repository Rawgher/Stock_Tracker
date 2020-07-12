class FriendsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friends.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Friend added"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to my_friends_path
  end

  def destroy
    friend = current_user.friends.where(friend_id: params[:id]).first
    friend.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
