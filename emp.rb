class Emphasis
  def initialize(emphasis)
    @emphasis = emphasis
    @emphasis.gsub!("*", "em_temp")
    @counter = 0
  end

  def emp_out
    if @emphasis.include?('em_temp')
      return emp_tag
    else
      return @emphasis
    end
  end


  def emp_tag
    while @emphasis.include?('em_temp')
      @emphasis = @emphasis.partition 'em_temp'
      if @counter.even?
        @counter += 1
        @emphasis[1] = "<em>"
      else
          @counter += 1
          @emphasis[1] = "</em>"
        end


          @emphasis = @emphasis.join
          end

          @emphasis
      end
end
