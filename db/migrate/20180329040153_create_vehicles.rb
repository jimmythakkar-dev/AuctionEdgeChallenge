class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.integer :auction_id
      t.integer :year
      t.string :make
      t.string :model
      t.integer :stock_number
      t.integer :winning_bid
      t.integer :seller_payout
      t.text :description

      t.timestamps
    end
  end
end
