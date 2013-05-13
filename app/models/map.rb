class Map < ActiveRecord::Base
  attr_accessible :name
  
  def updateContent(name, content, mapid)
    @pop=Pop.find(:all, :conditions => ["name=? and map_id=?", name, mapid])[0]
    @pop.comment=content
    @pop.save

  end
  
  def getMapId(id)
    return id
  end
  
  def getContent(mapid)
    count=0
    output=""
    #@pops=Pop.all
    @pops=Pop.find(:all, :conditions => ["map_id=?", mapid])
    output+="{"
    @pops.each do |pop|
      count+=1
      output+="\""+pop.name+"\":\""+pop.comment+"\""
      if (count<@pops.length)
        output+=","
      end

      @pops.length

    end
    output+="}"
    return output
  end
  
end
