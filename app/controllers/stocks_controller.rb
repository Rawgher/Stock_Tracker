class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/stock'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid stock symbol"
          format.js { render partial: 'users/stock' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a stock symbol"
        format.js { render partial: 'users/stock' }
      end
    end
  end

end
