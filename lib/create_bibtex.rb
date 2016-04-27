class CreateBibtex

  def self.createBibString

    allRefs = GetCitations.all_citations

    str = ""
    allRefs.each {|object| str << object.toBibTex}

    str << "\n"

    return str

  end


end
