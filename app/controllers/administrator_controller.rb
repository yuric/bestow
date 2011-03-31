class AdministratorController < ApplicationController
  before_filter :authenticate_user!
#  load_and_authorize_resource
  before_filter :loadMetaData
  def loadMetaData
    @pagetitle = "Administrator" 
  end
  
  def index
    
  end

  def details    
    
  end
  
  def show
    @pagetitle = "Error"
    render :status => 404
  end

end
