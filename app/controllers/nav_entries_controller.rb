class NavEntriesController < ApplicationController
  # GET /nav_entries
  # GET /nav_entries.xml
  def index
    @nav_entries = NavEntry.all #where(:parent_id => nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nav_entries }
    end
  end

  # GET /nav_entries/1
  # GET /nav_entries/1.xml
  def show
    @nav_entry = NavEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nav_entry }
    end
  end

  # GET /nav_entries/new
  # GET /nav_entries/new.xml
  def new
    @nav_entry = NavEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nav_entry }
    end
  end

  # GET /nav_entries/1/edit
  def edit
    @nav_entry = NavEntry.find(params[:id])
  end

  # POST /nav_entries
  # POST /nav_entries.xml
  def create
    @nav_entry = NavEntry.new(params[:nav_entry])

    respond_to do |format|
      if @nav_entry.save
        format.html { redirect_to(@nav_entry, :notice => 'Nav entry was successfully created.') }
        format.xml  { render :xml => @nav_entry, :status => :created, :location => @nav_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nav_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nav_entries/1
  # PUT /nav_entries/1.xml
  def update
    @nav_entry = NavEntry.find(params[:id])

    respond_to do |format|
      if @nav_entry.update_attributes(params[:nav_entry])
        format.html { redirect_to(@nav_entry, :notice => 'Nav entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nav_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nav_entries/1
  # DELETE /nav_entries/1.xml
  def destroy
    @nav_entry = NavEntry.find(params[:id])
    @nav_entry.destroy

    respond_to do |format|
      format.html { redirect_to(nav_entries_url) }
      format.xml  { head :ok }
    end
  end
end
