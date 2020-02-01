class FriendshipsController < ApplicationController

	def index
		@friends = current_user.friends
	end

	

	# private
	# def find_model
	# 	@model = Friendships.find(params[:id]) if params[:id]
	# end
end