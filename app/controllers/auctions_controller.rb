class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    respond_to do |format|
      format.html
    end
  end

  def show
  	@auction = Auction.find_by(id: params[:id])
  end

  def import
  	if params[:file]
	    Auction.import(params[:file]) 
	    respond_to do |format|
	    	format.html { redirect_to action: :index, notice: 'Auctions successfully imported.' }
	  	end
  	else
	    respond_to do |format|
    		format.html
  		end
		end
  end
end
