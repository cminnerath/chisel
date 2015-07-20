require_relative "./headers.rb"
require_relative "./emp.rb"
require_relative "./strong.rb"
require_relative "./paragrahs.rb"
require_relative "./lists.rb"
# f = File.open 'sample.md'
# track = f.read
# f.close
@lines = []

@in_paragraph = false
@in_list = false
@ordered_list = false

# require_relative lists.rb
# require_relative paragraphs.rb

def paragraph(line)
  paragraph_line = Paragraphs.new(line, @in_paragraph)

  if paragraph_line.start?
    @in_paragraph = true
    @lines << "<p>"
  end

  if @in_paragraph
    line = paragraph_line.nl_parse
    line = style line
    @lines << line
  end

  if paragraph_line.ended?
    @in_paragraph = false
    @lines << "</p>"
  end

  line
end


def style(line)
  line = Strong.new(line).strong_out
  line = Emphasis.new(line).emp_out
  line
end


def lists(line)
  list_line = Lists.new(line, @in_list)

  if list_line.start?
    if list_line.ordered?
      @ordered_list = true
      @lines << "<ol>"
    else
      @ordered_list = false
      @lines << "<ul>"
    end
    @in_list = true
  end

  if @in_list
    line = list_line.nl_parse
    line = style line
    @lines << line
  end

  if list_line.ended?
    if @ordered_list
      @lines << "</ol>"
    else
      @lines << "</ul>"
    end
    @in_list = false
  end

  line

end








File.readlines('sample.md').each do |line|
  if line.start_with?("#")
    line = Headers.new(line).convert_headers
    line = style line
    @lines << line
  elsif line.to_i > 0 || line.start_with?("* ") || @in_list
    line = lists(line)
  else
    line = paragraph line
  end
end

f = File.open "output.html", "w"
f.write @lines.join
f.close
