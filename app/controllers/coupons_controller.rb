class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.xml
  before_filter :authenticate_user!
  before_filter :loadMetaData
  load_and_authorize_resource
  
  def loadMetaData
    @pagetitle = "Welcome to Doutdes" 
  end
  
  def index
    #@businessforms = Businessform.near([33.3899756, -111.9632987], 100)# find all near Tempe,arizona 
		#@businessforms = Businessform.near([38.5729119, -122.443301], 100)#find all near angwin, ca #0.621371192
		
		#This was cut from the end of this method to the begining. Need to run some testing o make sure nothing is broken. 
		@geoip ||= GeoIP.new("#{Rails.root.to_s}/db/GeoLiteCity.dat")  #http://stackoverflow.com/questions/1988049/getting-a-user-country-name-from-originating-ip-address-with-ruby-on-rails  
    client_ip = request.remote_ip 
    if(client_ip == "127.0.0.1")
      client_ip = "24.104.139.215"# Use my outside ip if testing locally
    end
    if client_ip != "127.0.0.1" #todo: check for other local addresses or set default value
      location_location = @geoip.country(client_ip)
      if location_location != nil     
        @client_ip = location_location[1]
        @countryNameX = location_location[2]
        @countryNameMain = location_location[3]
        @countryFullName = location_location[4]
        @state = location_location[6]
        @city = location_location[7]
        @zipcode = location_location[8]
        @latitude = location_location[9]
        @longitude = location_location[10]
        @areacode = location_location[12]
      
        #all information is also store in the array bellow for convenience if more params are needed etc..
        @geoLocationArray = location_location
      
      end
    end
    
    custom_location = params[:searchCity].to_s
    if(custom_location.empty?)
      #@coupons = Coupon.all
      @coupons = Coupon.near([@latitude, @longitude], 50).paginate(:page => params[:page]||1, :per_page => 5)
      
    else# user chooses location | What is km or ly is selected?
      @city    = params[:searchCity].to_s
      @state   = params[:searchState].to_s
      @country = params[:searchCountry].to_s
      
      if params[:proximity] != "ALL" #there is a choice in distance
        @prox = params[:proximity].to_i
      else
        @prox = 9999999#13964m is the longest distance but I am being safe =), No choice, show all coupons
      end
      @coupons = Coupon.near("#{@city}, #{@state}, #{@country}", @prox)
      
    end    
    
    @map = initialize_map()
    @map.zoom = :bound
    @icon_org = Cartographer::Gicon.new(:name => "org",
          :image_url => '/images/icon.gif',
          :shadow_url => '/images/icon.gif',
          :width => 32,
          :height => 23,
          :shadow_width => 32,
          :shadow_height => 23,
          :anchor_x => 0,
          :anchor_y => 20,
          :info_anchor_x => 5,
          :info_anchor_x => 1)
    # Add the icons to map
    @map.icons <<  @icon_org
    @marker1 = Cartographer::Gmarker.new(:name=> "org11", :marker_type => "Organization",
              :position => [27.173006,78.042086],
              :info_window_url => "/welcome/sample_ajax",
              :icon => @icon_org) 
              
    # makerArray = Array.new
    @marker2 = Array.new 
    @marker2 << @marker1
    
    #@map.markers << @marker1
    nc = 11#need to do this to deferenciate from one coupon to another
    
    @coupons.each do |coupon|
      nc += 1
      dyname = "org#{nc}"
      @marker2X = Cartographer::Gmarker.new(:name=> dyname, :marker_type => "Organization",
                :position => [coupon.lat, coupon.lng],
                :info_window_url => "welcome/sample_ajax",#sample_ajax method is on this file,so just edit it with coupon dynamic content
                :icon => @icon_org)
                
      @marker2 << @marker2X
    end
    
    i = 0
    while i < @marker2.length do        
      @map.markers << @marker2[i]
      i = i + 1
    end
    
    
    
    #@client_ip = request.remote_ip# More: http://kev.in/2007/08/26/how-to-obtain-the-ip-address-of-the-current-user.html



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coupons }
    end
  end#end index
   
   
  # GET /coupons/1
  # GET /coupons/1.xml
  def show
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/new
  # GET /coupons/new.xml
  def new
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
  end

  # POST /coupons
  # POST /coupons.xml
  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to(@coupon, :notice => 'Coupon was successfully created.') }
        format.xml  { render :xml => @coupon, :status => :created, :location => @coupon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.xml
  def update
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to(@coupon, :notice => 'Coupon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.xml
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to(coupons_url) }
      format.xml  { head :ok }
    end
  end
  def sample_ajax
    render :text => "Success! Find me at Coupons_Controller"
  end
  private
  def initialize_map
    
     @map = Cartographer::Gmap.new( 'map' )   
      
     @map.controls << :type
     @map.controls << :large
     @map.controls << :scale
     @map.controls << :overview
     @map.debug = false 
     @map.marker_mgr = false
     @map.marker_clusterer = true
     
     cluster_icons = []
     
     
     org = Cartographer::ClusterIcon.new({:marker_type => "Organization"})
      org << {
                  :url => '/images/XX.gif',
                  :height => 32,
                   :width => 16,
                  :opt_anchor => [3, 0],
                  :opt_textColor => 'red'
                }
         #push second variant
      org << {
                  :url => '/images/drop.gif',
                  :height => 32,
                  :width => 23,
                  :opt_anchor => [20, 0],
                  :opt_textColor => 'black'
                }

        #push third variant
       org << {
                  :url => '/images/drop.gif',
                  :height => 73,
                  :width => 118,
                  :opt_anchor => [26, 0],
                  :opt_textColor => 'black'
              }
      cluster_icons << org
     
     
     
      @map.marker_clusterer_icons = cluster_icons
     
     
     
     return @map
   end
   #end new methods for maping
end
