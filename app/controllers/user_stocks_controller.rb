class UserStocksController < ApplicationController

	def create
		#through th link we send the USER and the ticker name
		#so from the ticker name we etract the stock object
		stock = Stock.check_db(params[:ticker])
		if stock.blank?
			stock = Stock.new_lookup(params[:ticker])
			stock.save
		end
		@user_stock = UserStock.create(user: current_user , stock: stock)
		flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
		redirect_to my_portfolio_path
		
	end

	def destroy
		#byebug
		stock = Stock.find( params[:id] )
		#.first will return the object
		user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
		user_stock.destroy
		flash[:notice] = "Stock #{stock.ticker} was successfully removed from your portfolio"
		redirect_to my_portfolio_path
	end
end
