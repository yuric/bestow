class Businessform < ActiveRecord::Base
  belongs_to :user
  geocoded_by :location, :latitude  => :lat, :longitude => :lng
  #reverse_geocoded_by :location, :latitude  => :lat, :longitude => :lng # to do these too at the same moder need to look up documentation on github
  validate :has_not_occurred
  #validates_uri_existence_of :url, :with => #http://snippets.dzone.com/posts/show/2563
  #        /(^$)|(^(http|https)://[a-z0-9] ([-.]{1}[a-z0-9] )*.[a-z]{2,5}(([0-9]{1,5})?/.*)?$)/ix
  after_validation :fetch_coordinates
  validates_format_of :email, :with =>/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
                              :message => "address is not valid"
  validates_format_of :zipcode, :with =>/^(\d{5})(-\d{4})?$/,
                              :message => "is not valid."
  def location
    [address_line_1, city, state, zipcode].compact.join(', ')
  end
  
  validates :user_login,
  :first_name,
  :last_name,
  :business_name,
  :address_line_1,
  #:address_line_2,
  :city,
  :state,#dropdown
  :country,#us and canada
  :zipcode,#us and canada format 
  #:website,
  :phone_number,
  :business_category,
  :business_subcategory,
  :more_about_your_business, :presence => true
  
  #*No P.O. Boxes
  #:access_count,
  #:lat,
  #:lng,
  #:user_id
  #:access_count
  #:user_id
  #:created_at
  #:updated_at
  #:Address_Line_2,
  #:local_notices,
  
  
  
  
  
  
  def has_not_occurred
    errors.add("address_line_1", ": no P.O. Box addresses please") if pobox?
  end
  def pobox?
    regEx = /([P|p]*(OST|ost)*\.*\s*[O|o|0]*(ffice|FFICE)*\.*\s*[B|b][O|o|0][X|x])/
    return (regEx.match(address_line_1))? true : false
  end
  
end



