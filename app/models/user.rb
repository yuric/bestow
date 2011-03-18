class User < ActiveRecord::Base
  has_many :businessforms
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable :confirmable\\ I did however generate the table for confirmable
  # it is just not added here for testing purposes
  devise :database_authenticatable, :registerable, :confirmable,# registarable allows new users to sign up
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable
  validates_uniqueness_of :username#, :email
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation
end
#User.find(1).update_attributes(:admin => true)
#User.find(1).confirm!
#u = User.find(1)
#u.update_attribute(:admin, true)
