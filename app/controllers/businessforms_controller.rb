class BusinessformsController < ApplicationController
  # GET /businessforms
  # GET /businessforms.xml
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_filter :loadMetaData
  def loadMetaData
    @pagetitle = "Businesses"
    @per_page  = "50" 
  end
  def index    
    #make sure user owns business form
    username = current_user.try(:username) 
  	if user_signed_in? && current_user.admin?
  		@businessforms = Businessform.find(:all).paginate(:page => params[:page], :per_page => @per_page) 
  		#@businessforms = Businessform.near([33.3899756, -111.9632987], 100)# find all near Tempe,arizona 
  		#@businessforms = Businessform.near([38.5729119, -122.443301], 100)#find all near angwin, ca
  	else
  		@businessforms = Businessform.find(:all, :conditions => "user_login = '#{username}'").paginate(:page => params[:page], :per_page => @per_page) 
  	end
  	
    #@businessforms = Businessform.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @businessforms }
    end
  end

  # GET /businessforms/1
  # GET /businessforms/1.xml
  def show
    @businessform = Businessform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @businessform }
    end
  end

  # GET /businessforms/new
  # GET /businessforms/new.xml
  def new
    @businessform = Businessform.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @businessform }
    end
   	  
  end

  # GET /businessforms/1/edit
  def edit
    @businessform = Businessform.find(params[:id])
  end

  # POST /businessforms
  # POST /businessforms.xml
  def create
    @businessform = Businessform.new(params[:businessform])

    respond_to do |format|
      if @businessform.save
        format.html { redirect_to(@businessform, :notice => 'Businessform was successfully created.') }
        format.xml  { render :xml => @businessform, :status => :created, :location => @businessform }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @businessform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /businessforms/1
  # PUT /businessforms/1.xml
  def update
    @businessform = Businessform.find(params[:id])

    respond_to do |format|
      if @businessform.update_attributes(params[:businessform])
        format.html { redirect_to(@businessform, :notice => 'Businessform was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @businessform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /businessforms/1
  # DELETE /businessforms/1.xml
  def destroy
    @businessform = Businessform.find(params[:id])
    @businessform.destroy

    respond_to do |format|
      format.html { redirect_to(businessforms_url) }
      format.xml  { head :ok }
    end
  end
end
