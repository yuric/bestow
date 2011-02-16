class AddBusinessIdentifierToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :business_identifier, :integer, :default => 0
  end

  def self.down
    remove_column :users, :business_identifier
  end
end
