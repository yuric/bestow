class ChangeBusinessDetailsFromStringToText < ActiveRecord::Migration
  def self.up
    change_table :businessforms do |t|
      t.change :more_about_your_business, :text
    end
  end


  def self.down
  end
end
