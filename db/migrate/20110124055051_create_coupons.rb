class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :address_Line1
      t.string :address_Line2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float :lat
      t.float :lng
      t.string :angel_business_name
      t.string :angel_business_website
      t.string :support_summary
      t.string :angel_business_type
      t.string :angel_business_name
      t.string :qualified_organization_type
      t.string :qualified_organization_name
      t.string :angel_discription_zoom_zero_AB
      t.string :angel_discription_zoom_zero_QO
      t.datetime :cause_start_date
      t.datetime :cause_end_date
      t.text :angel_full_discription_zoom_one
      t.integer :angel_business_id
      t.string :coupon_category
      t.string :coupon_subcategory
      t.integer :will_you_support
      t.integer :times_viewed
      t.string :curr_ip
      t.string :last_ip
      t.text :all_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
