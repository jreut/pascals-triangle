class Triangle
  attr_accessor :iterations, :cached_rows

  def initialize(iterations = 1)
    @iterations = iterations
    @cached_rows = [[1]]
  end

  def row_for_index(num)
    @cached_rows[num] ||= next_row(cached_rows[num - 1])
  end

  def augmented_row(row)
    [0,row,0].flatten
  end

  def next_row(row)
    augmented_row(row).each_cons(2).map do |a, b|
      a + b
    end
  end

  def rows
    iterations.times.map do |n|
      row_for_index(n)
    end
  end
end
