class Simplealert < ActiveRecord::Base
  
  validates :location_zip, :email, :presence => true
end
