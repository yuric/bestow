class HithereController < ApplicationController
  
  before_filter :authenticate_user!#,  :except => [:index, :show ]
  
  def contact
  end

  def about
  end

  def feedback
  end

  def errorpage
  end
  def chat  
  end
  
end
