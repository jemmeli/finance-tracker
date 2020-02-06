class UsersController < ApplicationController

  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

  def my_friends
  	@friends = current_user.friends
  end

  def search
  	#render json: params[:friend]
  	if @friend.present?

  		@friend = params[:friend]
  		respond_to do |format|
  			format.js { render partial: 'users/friend_result' }
  		end

  	else

  		respond_to do |format|
	  		flash.now[:alert] = "please enter name or email"
	  		format.js { render partial: 'users/friend_result' }	
  		end

  	end
  end



end
