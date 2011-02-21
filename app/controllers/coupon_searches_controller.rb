class CouponSearchesController < ApplicationController
  # GET /coupon_searches
  # GET /coupon_searches.xml
  def index
    @coupon_searches = CouponSearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coupon_searches }
    end
  end

  # GET /coupon_searches/1
  # GET /coupon_searches/1.xml
  def show
    @coupon_search = CouponSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coupon_search }
    end
  end

  # GET /coupon_searches/new
  # GET /coupon_searches/new.xml
  def new
    @coupon_search = CouponSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coupon_search }
    end
  end

  # GET /coupon_searches/1/edit
  def edit
    @coupon_search = CouponSearch.find(params[:id])
  end

  # POST /coupon_searches
  # POST /coupon_searches.xml
  def create
    @coupon_search = CouponSearch.new(params[:coupon_search])

    respond_to do |format|
      if @coupon_search.save
        format.html { redirect_to(@coupon_search, :notice => 'Coupon search was successfully created.') }
        format.xml  { render :xml => @coupon_search, :status => :created, :location => @coupon_search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coupon_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coupon_searches/1
  # PUT /coupon_searches/1.xml
  def update
    @coupon_search = CouponSearch.find(params[:id])

    respond_to do |format|
      if @coupon_search.update_attributes(params[:coupon_search])
        format.html { redirect_to(@coupon_search, :notice => 'Coupon search was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coupon_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_searches/1
  # DELETE /coupon_searches/1.xml
  def destroy
    @coupon_search = CouponSearch.find(params[:id])
    @coupon_search.destroy

    respond_to do |format|
      format.html { redirect_to(coupon_searches_url) }
      format.xml  { head :ok }
    end
  end
end
