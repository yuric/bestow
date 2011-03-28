class SimplealertsController < ApplicationController
  # GET /simplealerts
  # GET /simplealerts.xml
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :new, :create]
  before_filter :loadMetaData
  def loadMetaData
    @pagetitle = "Email Alerts" 
    @per_page  = "100"
  end
  def index
  	username = current_user.try(:username)
  	if user_signed_in? && current_user.admin?  # HINT from: http://godbit.com/article/rails-database-ease
      @simplealerts = Simplealert.all.paginate(:page => params[:page], :per_page => @per_page) 
  	else
  		@simplealerts = Simplealert.find(:all, :conditions => "alert_owner = '#{username}'").paginate(:page => params[:page], :per_page => @per_page) 
  	end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simplealerts }
    end
  end

  # GET /simplealerts/1
  # GET /simplealerts/1.xml
  def show
    @simplealert = Simplealert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simplealert }
    end
  end

  # GET /simplealerts/new
  # GET /simplealerts/new.xml
  def new
    @simplealert = Simplealert.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simplealert }
    end
  end

  # GET /simplealerts/1/edit
  def edit
    @simplealert = Simplealert.find(params[:id])
  end

  # POST /simplealerts
  # POST /simplealerts.xml
  def create
    @simplealert = Simplealert.new(params[:simplealert])
    #@simplealert.secrettoken = SecureRandom.hex(20)#using this to delete alerts
    
    if user_signed_in?
     @simplealert.alert_owner = current_user.username     
    else
      @simplealert.alert_owner = "Guest"
    end
    respond_to do |format|
      if @simplealert.save
        UserMailer.Created_new_Alert(@simplealert).deliver # unless unsubscribed(@simplealert.activealert) maybe?
        format.html { redirect_to root_url, :notice => "You have successfully created an email alert." }
        format.xml  { render :xml => @simplealert, :status => :created, :location => @simplealert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simplealert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simplealerts/1
  # PUT /simplealerts/1.xml
  def update
    @simplealert = Simplealert.find(params[:id])

    respond_to do |format|
      if @simplealert.update_attributes(params[:simplealert])
        format.html { redirect_to(@simplealert, :notice => 'Simplealert was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simplealert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simplealerts/1
  # DELETE /simplealerts/1.xml
 
  def destroy
    @simplealert = Simplealert.find(params[:id])    
    @simplealert.destroy
    
    #DEBUD DELETE ALL
    #@alerts = Simplealert.find(:all)
    #@alerts.each do |alert|
      #alert.destroy
    #end
    #END DEBUG DELETE ALL
    
    
    respond_to do |format|
      format.html { redirect_to(simplealerts_url) }
      format.xml  { head :ok }
    end
  end
end
