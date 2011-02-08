class CreateSimplealerts < ActiveRecord::Migration
  def self.up
    create_table :simplealerts do |t|
      t.string :email
      t.string :location
      t.string :location_zip
      t.integer :view_count
      t.integer :sent_count
      t.string :alert_owner

      t.timestamps
    end
  end

  def self.down
    drop_table :simplealerts
  end
end
