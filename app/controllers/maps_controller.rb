class MapsController < ApplicationController
  
   def fetch
    @map=Map.new
    
    render :json => @map.getContent([params[:mapid]][0])
  end
  
  def newtext
    @pop = Pop.new(name:[params[:name]][0], map_id:[params[:mapid]][0])
    @pop.save
    
  end
  
  def updatecontent
    @map=Map.new
    @map.updateContent([params[:name]][0], [params[:content]][0], [params[:mapid]][0])
  end
  
  def getmapid
    @map=Map.new

    render :json => @map.getMapId(params[:id])
  end
  
  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maps }
    end
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    @map = Map.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map }
    end
  end

  # GET /maps/new
  # GET /maps/new.json
  def new
    @map = Map.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(params[:map])

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render json: @map, status: :created, location: @map }
      else
        format.html { render action: "new" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maps/1
  # PUT /maps/1.json
  def update
    @map = Map.find(params[:id])

    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end
  
  def next
    map_id=params[:map]
    map_id+=1
    @map = Map.find(1)
    logger.debug 'loveyang'
    logger.debug @map
    
    redirect_to map_path(@map)
  end
  
end
