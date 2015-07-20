class Headers
  attr_accessor :header

  def initialize(header)
    @header = header
  end

  def convert_headers
    if header.count("#") == 1
      h1_convert
    elsif header.count("#") == 2
      h2_convert
    elsif header.count("#") == 3
      h3_convert
    elsif header.count("#") == 4
      h4_convert
    elsif header.count("#") == 5
      h5_convert
    else
      header
    end
  end


  def h1_convert
    header.delete! "#"
    header.gsub!(header, "<h1>#{header}</h1>")
  end

  def h2_convert
    header.delete! "#"
    header.gsub!(header, "<h2>#{header}</h2>")
  end

  def h3_convert
    header.delete! "#"
    header.gsub!(header, "<h3>#{header}</h3>")
  end

  def h4_convert
    header.delete! "#"
    header.gsub!(header, "<h4>#{header}</h4>")
  end

  def h5_convert
    header.delete! "#"
    header.gsub!(header, "<h5>#{header}</h5>")
  end

end
