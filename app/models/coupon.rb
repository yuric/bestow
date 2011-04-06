class Coupon < ActiveRecord::Base
  #belongs_to :user

    @username = "empty"
    @admin = false

  
  def self.setUser(name, isAdmin)
    @username = name
    @admin = isAdmin
    #puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nMODEL=>#{@username}\nAdmin?=#{@admin}\n<=\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
  end
  
  def self.get_user (user)#an attempt to access the current_user but did not work
    @user = user
    self.setUser(user.username,user.admin?)
  end 

  PROXIMITYOPTIONS = ["5","10","15","20","25","30","35","40","45","50","60","70","80","90","100","200","300","500","ALL"]
  DISTANCEOPTIONS = ["Miles", "KM","LY"]
  #puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nMODEL=>#{@user.username}<=\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
  geocoded_by :location, :latitude  => :lat, :longitude => :lng
  #reverse_geocoded_by :location, :latitude  => :lat, :longitude => :lng # to do these too at the same moder need to look up documentation on github
  #validates_uri_existence_of :url, :with => #http://snippets.dzone.com/posts/show/2563
  #        /(^$)|(^(http|https)://[a-z0-9] ([-.]{1}[a-z0-9] )*.[a-z]{2,5}(([0-9]{1,5})?/.*)?$)/ix
  validate :has_not_occurred

  after_validation :fetch_coordinates
  validates_length_of :address_line1, :in => 1..200, :message=>"needs to contain your address."                           
  validates_length_of :address_line2, :in => 1..200, :allow_blank => true,  :message=>"is too long."
  validates_length_of :city, :in => 3..99, :message=>"is not valid."                           
  validates_length_of :state, :in => 2..99, :message=>"is not valid."
  validates_format_of :country, :with =>/(United States of America)/,
                              :message => "name is invalid. For now US only sorry."
  validates_format_of :zipcode, :with =>/^(\d{5})(-\d{4})?$/, :message => "is not valid."
  validates_length_of :angel_business_name, :in => 2..70, :message=>"between 2 and 70 characters please."
  validates_url_format_of :angel_business_website,
                              :allow_nil => false,
                              :message => 'you provided does not appear to be a valid URL.'
  validates_length_of :support_summary, :in => 10..160, :message=>"Summarize your deal in 10 to 160 characters."
  validates_length_of :angel_business_type, :in => 4..64, :message=>"Select one please." 
  validates_length_of :qualified_organization_name, :in => 4..64, :message=>"is invalid." 
  validates_length_of :angel_discription_zoom_zero_ab, :in => 12..160, :message=>"between 12 and 160 characters please." 
  validates_length_of :angel_discription_zoom_zero_qo, :in => 12..160, :message=>"between 12 and 160 characters please." 
                           
  #******TODO: Validate all the hidden fields as well to prevent hacking
  validates  :angel_business_name,
  #:city,
  #:state,
  #:country,
  #:zipcode,
  #:angel_business_name,
  #:support_summary,
  #:angel_business_type,
  #:qualified_organization_name,
  #:qualified_organization_type,
  #:qualified_organization_name,
  #:angel_discription_zoom_zero_ab,
  #:angel_discription_zoom_zero_qo,
  :cause_start_date,
  :cause_end_date,
  #:angel_full_discription_zoom_one,
  #:coupon_category,
  :coupon_subcategory, :presence => true
  #:angel_business_id
  #:will_you_support
  #:times_viewed#User can see this value?

   #regular expression for po box
   #reg = ^(?:[1-9][0-9]?(?:\.[0-9]{1,2})?|0?.0[1-9]|0?.[1-9][0-9]?)$
   #http://www.regexbuddy.com/
  def location
    [address_line1, city, state, zipcode].compact.join(', ')
  end
  
  def has_not_occurred
    errors.add("address_line1", ": no P.O. Box addresses please") if pobox?
    errors.add("angel_business_type","Please pick a proper Business category") if !businessCategory?
    errors.add("state","is not a valid state") if !validState?
    errors.add("coupon_owner","name is not valid:#{@username}") if !validCouponOwner?
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nCO=>#{@username},#{@username.to_s}<=\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
    
    ##*****TO DO: Make sure user is not creating a coupon uder another users identity.
    #errors.add("coupon_owner","You can not create a coupon with this username: #{@username}") if !validCouponOwner?
  end
  
  def pobox?
    regEx = regEx = /([P|p]*(OST|ost)*\.*\s*[O|o|0]*(ffice|FFICE)*\.*\s*[B|b][O|o|0][X|x])/
    #Original Reg Ex: /\b[P|p]*(OST|ost)*\.*\s*[O|o|0]*(ffice|FFICE)*\.*\s*[B|b][O|o|0][X|x]\b$/
    return (regEx.match(address_line1))? true : false
  end
  def businessCategory?
    return Variables::BUSINESS_CATEGORIES.include?(angel_business_type)
  end
  def validState?    
    return Variables::ALLSTATES.include?(state)
  end
  def validCouponOwner?#*****TO DO: Make sure user is not creating a coupon uder another users identity.
    #puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nMODEL=>#{@user.username}\nAdmin?=#{@user.admin?}\nCO=#{:coupon_owner.value}<=\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    #puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nCO=#{coupon_owner}\nUser:#{@user.username}<=\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    return coupon_owner == @username #|| @isadmin  # Validate Coupon_owner with username to make sure hackers do not assign whatever name they want to coupon_owner field.
  end

   
   
end
