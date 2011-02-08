class CreateFoocancans < ActiveRecord::Migration
  def self.up
    create_table :foocancans do |t|
      t.string :author
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :foocancans
  end
end
