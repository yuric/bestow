class ChangeBusinessformAllToLowercase < ActiveRecord::Migration
  def self.up
    rename_column :businessforms, :Address_Line_1, :address_line_1
    rename_column :businessforms, :Address_Line_2, :address_line_2
    
  end

  def self.down
  end
end
