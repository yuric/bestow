module ApplicationHelper
  
  def mark_required(object, attribute)  #rails cast 211
    ""#"*" if object.class.validators_on(attribute).any?#This is not working => { |validator| validator.is_a?(ActiveModel::Validations::LengthValidator) } else "#"# true#ActiveModel::Validations::PresenceValidator# || (ActiveModel::Validations::PresenceValidator || ActiveModel::Validations::LengthValidator || ActiveModel::Validations::FormatValidator || true ) 
  end
  
  
  
  
=begin  
  def label(object, attribute, method, label)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end
=end  
end

=begin

:LengthValidator
:FormatValidator
:PresenceValidator

=end