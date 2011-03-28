class AddTokenLogicToAlert < ActiveRecord::Migration
  def self.up
   add_column :simplealerts, :activealert, :boolean, :default => true
   add_column :simplealerts, :secrettoken, :string
    
  end

  def self.down
    remove_column :simplealerts, :activealert, :boolean, :default => true
    remove_column :simplealerts, :secrettoken, :string
  end
  
end
