class CreateBibtex

  def self.createBibString

    allArticles = Article.all

    str = ""
    allArticles.each {|object| str << object.toBibTex}

    str << "\n"

    return str

  end


end
