module AuctionsHelper
  def vehicles_sold(auction)
  	auction.vehicles.length
  end

  def calculate_profit(auction)
  	auction_vehicles = auction.vehicles
    auction_vehicles.map(&:winning_bid).sum - auction_vehicles.map(&:seller_payout).sum
  end
end