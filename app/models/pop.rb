class Pop < ActiveRecord::Base
  attr_accessible :comment, :lat, :long, :name
  
  def updateContent(name, content)
    @pop=Pop.find(:all, :conditions => ["name=?", name])[0]
    @pop.comment=content
    @pop.save

  end
  
  def getContent
    count=0
    output=""
    @pops=Pop.all
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
