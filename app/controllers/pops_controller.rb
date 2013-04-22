class PopsController < ApplicationController
  
  def fetch
    @pop=Pop.new
    
    render :json => @pop.getContent
  end
  
  def newtext
    @pop = Pop.new(name:[params[:name]][0])
    @pop.save
    
  end
  
  def updatecontent
    @pop=Pop.new
    @pop.updateContent([params[:name]][0], [params[:content]][0])
  end
  
  # GET /pops
  # GET /pops.json
  def index
    @pops = Pop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pops }
    end
  end

  # GET /pops/1
  # GET /pops/1.json
  def show
    @pop = Pop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pop }
    end
  end

  # GET /pops/new
  # GET /pops/new.json
  def new
    @pop = Pop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pop }
    end
  end

  # GET /pops/1/edit
  def edit
    @pop = Pop.find(params[:id])
  end

  # POST /pops
  # POST /pops.json
  def create
    @pop = Pop.new(params[:pop])

    respond_to do |format|
      if @pop.save
        format.html { redirect_to @pop, notice: 'Pop was successfully created.' }
        format.json { render json: @pop, status: :created, location: @pop }
      else
        format.html { render action: "new" }
        format.json { render json: @pop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pops/1
  # PUT /pops/1.json
  def update
    @pop = Pop.find(params[:id])

    respond_to do |format|
      if @pop.update_attributes(params[:pop])
        format.html { redirect_to @pop, notice: 'Pop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pops/1
  # DELETE /pops/1.json
  def destroy
    @pop = Pop.find(params[:id])
    @pop.destroy

    respond_to do |format|
      format.html { redirect_to pops_url }
      format.json { head :no_content }
    end
  end
end
