class ChangeBusinessNameToLowercase < ActiveRecord::Migration
  def self.up
    rename_column :businessforms, :Business_Name, :business_name 
  end

  def self.down
  end
end
