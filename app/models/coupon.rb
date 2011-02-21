class Coupon < ActiveRecord::Base
  #belongs_to :user  
  PROXIMITYOPTIONS = ["5","10","15","20","25","30","35","40","45","50","60","70","80","90","100","200","300","500","ALL"]
  DISTANCEOPTIONS = ["Miles", "KM","LY"]  
  geocoded_by :location, :latitude  => :lat, :longitude => :lng
  #reverse_geocoded_by :location, :latitude  => :lat, :longitude => :lng # to do these too at the same moder need to look up documentation on github
  #validates_uri_existence_of :url, :with => #http://snippets.dzone.com/posts/show/2563
  #        /(^$)|(^(http|https)://[a-z0-9] ([-.]{1}[a-z0-9] )*.[a-z]{2,5}(([0-9]{1,5})?/.*)?$)/ix
  validate :has_not_occurred
  after_validation :fetch_coordinates
  
  validates :address_line1,
  :city,
  :state,
  :country,
  :zipcode, 
  :angel_business_name,
  :support_summary,
  :angel_business_type,
  :qualified_organization_type,
  :qualified_organization_name,
  :angel_discription_zoom_zero_ab,
  :angel_discription_zoom_zero_qo,
  :cause_start_date,
  :cause_end_date,
  :angel_full_discription_zoom_one,
  :coupon_category,
  :coupon_subcategory, :presence => true
  #:angel_business_id
  #:will_you_support
  #:times_viewed#User can see this value

   #regular expression for po box
   #reg = ^(?:[1-9][0-9]?(?:\.[0-9]{1,2})?|0?.0[1-9]|0?.[1-9][0-9]?)$
   #http://www.regexbuddy.com/
  def location
    [address_line1, city, state, zipcode].compact.join(', ')
  end
  
  def has_not_occurred
    errors.add("address_line_1", ": no P.O. Box addresses please") if pobox?
  end
  def pobox?
    regEx = regEx = /([P|p]*(OST|ost)*\.*\s*[O|o|0]*(ffice|FFICE)*\.*\s*[B|b][O|o|0][X|x])/
    #Original Reg Ex: /\b[P|p]*(OST|ost)*\.*\s*[O|o|0]*(ffice|FFICE)*\.*\s*[B|b][O|o|0][X|x]\b$/
    return (regEx.match(address_line1))? true : false
  end
  
  def self.search(search)#non-active methods at this point
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nhellow world\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
    if search
      where (Coupon.near([@latitude, @longitude]))
    else
      scoped
    end
  end
   
   
end
