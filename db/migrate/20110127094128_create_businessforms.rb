class CreateBusinessforms < ActiveRecord::Migration
  def self.up
    create_table :businessforms do |t|
      t.string :user_login
      t.string :first_name
      t.string :last_name
      t.string :business_Name
      t.string :address_Line_1
      t.string :address_Line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float :lat
      t.float :lng
      t.boolean :local_notices
      t.string :website
      t.string :phone_number
      t.string :business_category
      t.string :business_subcategory
      t.boolean :signed_in
      t.string :more_about_your_business
      t.integer :access_count
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :businessforms
  end
end
