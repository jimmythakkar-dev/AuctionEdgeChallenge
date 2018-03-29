class Auction < ApplicationRecord
	has_many :vehicles, dependent: :destroy


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      auction_hash = row.to_hash
      auction = find_or_create_by!(name: auction_hash['auction name'],
    															 address: auction_hash['street address'],
    															 city: auction_hash['city'],
    															 state: auction_hash['state'],
    															 zip: auction_hash['zip'])
      vehicle = auction.vehicles.find_or_create_by!(year: auction_hash['vehicle year'],
					    																	    make: auction_hash['vehicle make'],
					    																	    model: auction_hash['vehicle model'],
					    																	    stock_number: auction_hash['vehicle stock number'],
					    																	    winning_bid: auction_hash['winning bid'],
					    																	    seller_payout: auction_hash['seller payout'],
					    																	    description: auction_hash['description'])
    end
  end
end
