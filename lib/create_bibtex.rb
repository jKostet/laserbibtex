class CreateBibtex

  def createBibString

    allRefs = Article.all
    str = ""
    allRefs.each {|object| str << object.toBibTex}

    str << "\n"
    
    return str

  end


end
