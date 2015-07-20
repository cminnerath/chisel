class Lists

  def initialize(list, in_list)
    @list = list
    @in_list = in_list
  end

  def ended?
    @list == "\n" && @in_list
  end

  def start?
    @list != "\n" && !@in_list
  end

  def ordered?
    @list.to_i > 0
  end

  def list_format
    if ordered?
      len = @list.to_i.to_s.length
      @list[(len + 1)..-1]
    else
      @list[2..-1]
    end

  end


  def nl_parse
    if !ended?
      list = list_format
      list = "<li>\n#{list}\n</li>"
      list
    else
      ""
    end
  end

end



















#
#   def list_out
#     if @list.include?('li_temp')
#       return li_tag
#     elsif @list.include?('nu_temp')
#       return nu_tag
#     else
#       return @list
#     end
#   end
#
#   def nu_tag
#     if @list.to_i > 0
#       then @list.gsub
#
#
#
#   def li_tag
#     while @list.include?('li_temp')
#       @list = @list.partition 'em_temp'
#       @list = "<li>\n#{list}\n</li>"
#       else
#           @list = @list.join
#         end
#
#           @list
#       end
# end
