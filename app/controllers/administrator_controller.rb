class AdministratorController < ApplicationController
  before_filter :authenticate_user!
#  load_and_authorize_resource
  before_filter :loadMetaData
  def loadMetaData
    @pagetitle = "Welcome Administrator" 
  end
  
  def index
    
  end

  def details
    
  end

end
