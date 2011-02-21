class CreateCouponSearches < ActiveRecord::Migration
  def self.up
    create_table :coupon_searches do |t|
      t.string :search_city
      t.string :search_state
      t.string :search_country
      t.string :search_zipcode
      t.string :search_proximity
      t.string :search_units

      t.timestamps
    end
  end

  def self.down
    drop_table :coupon_searches
  end
end
