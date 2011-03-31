class ErrorsController < ApplicationController
  def notfound404
    
    render :status => 404
  end

  def authorizednot
  end

end
