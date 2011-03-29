class Simplealert < ActiveRecord::Base
  
  validates :location_zip, :email, :presence => true
  validates_format_of :email, :with =>/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
                              :message => "address is not valid"
  validates_format_of :location_zip, :with =>/^(\d{5})(-\d{4})?$/,
                              :message => " is not valid"
end
