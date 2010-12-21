class NavEntriesController < ApplicationController
  # GET /nav_entries
  # GET /nav_entries.xml
  def index
    get_system
    @nav_entries = NavEntry.where("system_id = ? AND parent_id IS NULL", @system).order("seq ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nav_entries }
    end
  end

  # GET /nav_entries/1
  # GET /nav_entries/1.xml
  def show
    get_system
    @nav_entry = NavEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nav_entry }
    end
  end

  # GET /nav_entries/new
  # GET /nav_entries/new.xml
  def new
    get_system
    @parent = NavEntry.find(params[:parent_id]) unless params[:parent_id].nil?
    @nav_entry = NavEntry.new(:system => @system, :parent => @parent)
    get_parents

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nav_entry }
    end
  end

  # GET /nav_entries/1/edit
  def edit    
    get_system
    @nav_entry = NavEntry.find(params[:id])
    get_parents
  end

  # POST /nav_entries
  # POST /nav_entries.xml
  def create    
    get_system
    @nav_entry = NavEntry.new(params[:nav_entry])
    get_parents

    respond_to do |format|
      if @nav_entry.save
        format.html { redirect_to(system_path(@system), :notice => 'Nav entry was successfully created.') }
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
    get_system
    @nav_entry = NavEntry.find(params[:id])
    get_parents

    respond_to do |format|
      if @nav_entry.update_attributes(params[:nav_entry])
        format.html { redirect_to(system_nav_entry_path(@system, @nav_entry), :notice => 'Nav entry was successfully updated.') }
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
    get_system
    @nav_entry = NavEntry.find(params[:id])
    @nav_entry.destroy

    respond_to do |format|
      format.html { redirect_to(system_url(@system)) }
      format.xml  { head :ok }
    end
  end
  
  private
  def get_system
    @system = System.find(params[:system_id])
  end
  
  def get_parents
    # if @nav_entry.nil? || @nav_entry.id.nil?
    #   @parents = NavEntry.where("system_id = ?", @system
    #     ).order("parent_id ASC, seq ASC")
    # else
    #   @parents = NavEntry.where("system_id = ? AND id <> ?", @system, @nav_entry
    #     ).order("parent_id ASC, seq ASC")
    # end
    
    @parents = []
    @system.roots.each do |n|      
      add_self_and_children(n)
    end
  end
  
  def add_self_and_children(nav_entry, indent = '')
    unless @nav_entry == nav_entry
      @parents << [indent + nav_entry.content, nav_entry.id]
      indent += '>'
      nav_entry.children.each do |n|
        add_self_and_children(n, indent)
      end
    end
  end
end
