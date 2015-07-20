class Strong

  def initialize(strong)
    @strong = strong
    @strong.gsub!('**', 'str_temp')
    @counter = 0
  end

  def strong_out
    if @strong.include?('str_temp')
      return strong_tag
    else
      return @strong
    end
  end

  def strong_tag
    while @strong.include?('str_temp')
    @strong = @strong.partition 'str_temp'
    if @counter.even?
      @counter += 1
      @strong[1] = "<strong>"
    else
      @counter += 1
      @strong[1] = "</strong>"
    end

  @strong = @strong.join
  end

  @strong
end
end
