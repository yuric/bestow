class FoocancansController < ApplicationController
  # GET /foocancans
  # GET /foocancans.xml
  load_and_authorize_resource
  def index
    @foocancans = Foocancan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foocancans }
    end
  end
 
  # GET /foocancans/1
  # GET /foocancans/1.xml
  def show
    @foocancan = Foocancan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foocancan }
    end
  end

  # GET /foocancans/new
  # GET /foocancans/new.xml
  def new
    @foocancan = Foocancan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foocancan }
    end
  end

  # GET /foocancans/1/edit
  def edit
    @foocancan = Foocancan.find(params[:id])
  end

  # POST /foocancans
  # POST /foocancans.xml
  def create
    @foocancan = Foocancan.new(params[:foocancan])

    respond_to do |format|
      if @foocancan.save
        format.html { redirect_to(@foocancan, :notice => 'Foocancan was successfully created.') }
        format.xml  { render :xml => @foocancan, :status => :created, :location => @foocancan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foocancan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foocancans/1
  # PUT /foocancans/1.xml
  def update
    @foocancan = Foocancan.find(params[:id])

    respond_to do |format|
      if @foocancan.update_attributes(params[:foocancan])
        format.html { redirect_to(@foocancan, :notice => 'Foocancan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foocancan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foocancans/1
  # DELETE /foocancans/1.xml
  def destroy
    @foocancan = Foocancan.find(params[:id])
    @foocancan.destroy

    respond_to do |format|
      format.html { redirect_to(foocancans_url) }
      format.xml  { head :ok }
    end
  end
end
