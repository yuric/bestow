class Admin
  include DataMapper::Resource  
  
  property :id,   Serial
  property :username, String
  
  devise :authenticatable, :registerable, :timeoutable, :recoverable
  
  def self.create!(*args)
    create(*args)
  end
  
end
