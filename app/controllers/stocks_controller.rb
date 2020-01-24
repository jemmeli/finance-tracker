class StocksController < ApplicationController
  def search
  	#byebug
  	#scenario when the form empty
  	if params[:stock].present?
  		# the @ simbole for instance variable to use in the view
	  	@stock = Stock.new_lookup(params[:stock])
	  	#if not null
	  	if @stock
	  		#setup javascript response and remove the html response
	  		respond_to do |format|
	  			format.js {render partial: 'users/result'}
	  		end
	  	else
	  		respond_to do |format|
	  			#.now prevent the flash to take the full response/request cycle
	  			flash.now[:alert] = "please enter a valid Syumbol to Search"
	  			format.js {render partial: 'users/result'}
	  		end
	  	end

	else
		respond_to do |format|
  			flash.now[:alert] = "please enter Syumbol to Search"
  			format.js {render partial: 'users/result'}
  		end
	end

  end
end
