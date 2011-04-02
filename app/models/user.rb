
class User < ActiveRecord::Base
  has_many :businessforms
  before_save :downcase_email

#Dowcasing to get read of case sensitivity My current devise version(1.1rc): https://github.com/plataformatec/devise/issues/661
  protected
  def downcase_email
    #self.username.downcase!
    self.email.downcase!
  end

  def self.find_for_authentication(conditions) 
    #conditions[:username].try(:downcase!)
    conditions[:email].try(:downcase!)

    super
  end

  def self.find_or_initialize_with_error_by(attribute, value, error=:invalid)
    #value.downcase! if attribute == :username
    value.downcase! if attribute == :email

    super
  end
  
# if I update devise I have to use the code below to accomplish the above.
### DEVISE LATEST (1.2rc) ###

#class User < ActiveRecord::Base
   
#  before_save :downcase_email

#  def self.find_for_authentication(conditions) 
#    conditions[:email].try(:downcase!)
#    super
#  end

#  def self.find_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
#    attributes[:email].try(:downcase!)
#    super
#  end

#  protected

#  def downcase_email
#    self.email.downcase!
#  end

#end
  
#The end of case sensitivity care


  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable :confirmable\\ I did however generate the table for confirmable
  # it is just not added here for testing purposes
  devise :database_authenticatable, :confirmable, :registerable,# registarable allows new users and I might HAVE to comment it out because I have a user_controller
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable,:timeoutable
  validates_uniqueness_of :username#, :email
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation
end
#User.find(1).update_attributes(:admin => true)
#User.find(1).confirm!
#u = User.find(1)
#u.update_attribute(:admin, true)
