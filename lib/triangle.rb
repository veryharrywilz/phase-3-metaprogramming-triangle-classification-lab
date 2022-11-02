require 'pry'

class Triangle


  attr_accessor :l1, :l2, :l3, :kind

  def initialize (l1, l2, l3)
    @l1=l1
    @l2=l2
    @l3=l3
    @first_side_array = []
    @first_side_array << l1
    @first_side_array << l2
    @first_side_array << l3
    @side_array = @first_side_array.tally
    @pythag_array = @first_side_array.sort

  end

  def kind
    self.measure
    self.inequality_measure
    if @side_array.length == 1
      :equilateral
    elsif @side_array.length == 2
      :isosceles
    elsif @side_array.length == 3
      :scalene
    end
    
  end


  def measure
    @first_side_array.each do |side|
      if side == 0
        raise TriangleError
      elsif side < 0
        raise TriangleError
      end
    end
  end

  def inequality_measure
    if (@pythag_array[0] + @pythag_array[1]) <= @pythag_array[2]
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end


end

# binding.pry
