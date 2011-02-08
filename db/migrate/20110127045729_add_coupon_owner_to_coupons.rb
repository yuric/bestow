class AddCouponOwnerToCoupons < ActiveRecord::Migration
  def self.up
    add_column :coupons, :coupon_owner, :string
    
  end

  def self.down
    remove_column :coupons, :coupon_owner
    
  end
end
