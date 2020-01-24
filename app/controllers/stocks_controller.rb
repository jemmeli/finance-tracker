class StocksController < ApplicationController
  def search
  	#byebug
  	#scenario when the form empty
  	if params[:stock].present?
  		# the @ simbole for instance variable to use in the view
	  	@stock = Stock.new_lookup(params[:stock])
	  	if @stock
	  		render 'users/my_portfolio'
	  	else
	  		flash[:alert] = "please enter a valid Syumbol to Search"
			redirect_to my_portfolio_path
	  	end

	else
		flash[:alert] = "please enter a Syumbol to Search"
		redirect_to my_portfolio_path
	end

  end
end
