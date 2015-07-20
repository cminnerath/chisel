class Paragraphs

  attr_accessor :paragraph

  def initialize(paragraph, in_paragraph)
    @paragraph = paragraph
    @in_paragraph = in_paragraph
  end

  #
  # def paragraph_format
  # paragraph.gsub!(paragraph, "<p>" + " #{paragraph}" +"</p>")
  #
  # end

  # def line_break
  #   paragraph.gsub!("\n", "<br>")
  # end

  def ended?
    if @paragraph == "\n" && @in_paragraph
      # puts @paragraph = "</p>"
    end
    @paragraph == "\n" && @in_paragraph
  end

  def start?
    @paragraph != "\n" && !@in_paragraph
  end




  def nl_parse
    if @paragraph == "\n"
      # puts @paragraph = "</p>"
    else
      # puts @paragraph = "<p>" + @paragraph
    end
    @paragraph
  end
end
