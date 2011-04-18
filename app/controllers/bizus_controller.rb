class BizusController < ApplicationController
  respond_to :html
  respond_to :js, :only => [:delete_bizu_file]

  layout 'home',        :only   => [:index]
  layout 'application', :except => [:index]

  # GET /search
  # GET /search.xml
  def search
    @bizus = Bizu.search do
      keywords params[:query]           if params[:query]
      with :category, params[:category] if params[:category]
      paginate :page => params[:page], :per_page => 5
    end

    respond_with @bizus.results
  end

  # GET /bizus
  # GET /bizus.xml
  def index
    @bizus = Bizu.all.paginate :page => params[:page], :per_page => 5

    respond_with @bizus
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @bizus }
    # end
  end

  # GET /bizus/1
  # GET /bizus/1.xml
  def show
    @bizu = Bizu.find(params[:id])

    respond_with @bizu
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @bizu }
    # end
  end

  # GET /bizus/new
  # GET /bizus/new.xml
  def new
    @bizu = Bizu.new

    respond_with @bizu
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @bizu }
    # end
  end

  # GET /bizus/1/edit
  def edit
    @bizu = Bizu.find(params[:id])
  end

  # POST /bizus
  # POST /bizus.xml
  def create
    @bizu = Bizu.new(params[:bizu])

    respond_to do |format|
      if @bizu.save && create_bizu_files(@bizu, params[:bizu_files]) && @bizu.save
        format.html { redirect_to(@bizu, :notice => 'Bizu was successfully created.') }
        format.xml  { render :xml => @bizu, :status => :created, :location => @bizu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bizu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bizus/1
  # PUT /bizus/1.xml
  def update
    @bizu = Bizu.find(params[:id])

    create_bizu_files @bizu, params[:bizu_files]
    respond_to do |format|
      if @bizu.update_attributes(params[:bizu])
        format.html { redirect_to(@bizu, :notice => 'Bizu was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bizu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bizus/1
  # DELETE /bizus/1.xml
  def destroy
    @bizu = Bizu.find(params[:id])
    @bizu.destroy

    respond_with @bizu
    # respond_to do |format|
    #   format.html { redirect_to(bizus_url) }
    #   format.xml  { head :ok }
    # end
  end

  # DELETE /delete_bizu_file/1
  # DELETE /delete_bizu_file/1.xml
  def delete_bizu_file
    @bizu = Bizu.find(params[:id]).bizu_files.find(params[:bizu_file_id])
    @bizu.destroy

    respond_with @bizu
    # respond_to do |format|
    #   format.js
    # end
  end

  protected
  def create_bizu_files(bizu, bizu_files_params)
    bizu_files_params.all? do |index, bizu_file_params|
      bizu_file = bizu.bizu_files.create bizu_file_params
      bizu_file.valid?
    end
  end
end
