# models/ability.rb
class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.admin?
      can :manage, :all
    else
      can :read, :all#Coupon, Foocancan, Businessform
      
      #Foocan
      can :create, Foocancan
      can :update, Foocancan do |foocancan|
       foocancan.try(:author) == user.username || user.admin?
      end
      can :destroy, Foocancan do |foocancan|
       foocancan.try(:author) == user.username || user.admin?
      end
      #end
      
      #Coupons
      can :create, Coupon
      can :update, Coupon do |coupon|
       coupon.try(:coupon_owner) == user.username || user.admin?
      end
      can :destroy, Coupon do |coupon|
       coupon.try(:coupon_owner) == user.username || user.admin?
      end
      #end
      
      #Business Form
      can :create, Businessform
      can :update, Businessform do |businessform|
       businessform.try(:user_login) == user.username || user.admin?
      end
      #end
      
      #simple alert
      can :create, Simplealert
      can :update, Simplealert do |simplealert|
       simplealert.try(:alert_owner) == user.username || user.admin?
      end
      #end
        
    end
  end
end
