class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = 'Follwing friend'
    else
      flash[:alert] = "there was somthing wrong with tracking request"
    end
    redirect_to my_friends_path
  end


  def destroy
    #byebug
    friendship = current_user.friendships.where( friend_id: params[:id] ).first
    friendship.destroy
    flash[:notice] = "STOP Following"
    redirect_to my_friends_path
  end
end
