class CouponAllToLowecase < ActiveRecord::Migration
  def self.up
    rename_column :coupons, :address_Line1, :address_line1
    rename_column :coupons, :address_Line2, :address_line2
    rename_column :coupons, :angel_discription_zoom_zero_AB, :angel_discription_zoom_zero_ab
    rename_column :coupons, :angel_discription_zoom_zero_QO, :angel_discription_zoom_zero_qo
  end

  def self.down
  end
end
