class Triangle
  def initialize(number)
    @number = number
    @array = []
  end

  def rows
    @number.times do
      prev_array = @array.last || []
      new_array = []
      prev_array.each_with_index do |num, i|
        if i == 0
          num = 0
        else
          num = prev_array[i-1]
        end
        new_array << prev_array[i] + num
      end
      new_array << 1
      @array << new_array
    end
    @array
  end

end
