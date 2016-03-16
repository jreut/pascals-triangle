class Triangle
  attr_reader :height

  def initialize(height)
    @height=height
    @triangle_array = []
    @last_row = [1]
  end

  def rows
    1.upto(height) do |num|
      @triangle_array<<next_row(num)
    end
    @triangle_array
  end

  def next_row(num)
    return @last_row if num == 1  
    num.even? ? @last_row = even_row : @last_row = odd_row
  end

  def even_row
    (half_next_row << half_next_row.reverse).flatten
  end

  def odd_row
    (half_next_row << (half_last_row[-1]*2) << half_next_row.reverse).flatten
  end

  def half(num)
    num.even? ? (num/2)-1 : (num/2)
  end

  def half_last_row
    @last_row[0..half(@last_row.length)]
  end

  def half_next_row
    new_row = [1]
    half_last_row.each_with_index do |num, index|
      index+1==half_last_row.length ? break : new_row<<(num+half_last_row[index+1])
    end
    new_row
  end
end
