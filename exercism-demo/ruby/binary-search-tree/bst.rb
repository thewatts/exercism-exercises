class Bst

  attr_reader :pointer

  def initialize(input)
    @pointer = Node.new(input)
  end

  def each
    all_data.each do |value|
      yield value
    end
  end

  def all_data
    pointer.all_data.flatten.sort
  end

  def data
    pointer.data
  end

  def insert(input)
    case
    when input > pointer.data
      pointer.add_right(input)
    when input < pointer.data || input == pointer.data
      pointer.add_left(input)
    end
  end

  def left
    pointer.left
  end

  def right
    pointer.right
  end
end

class Node

  attr_reader :value, :left, :right

  def initialize(number)
    @value = number
    @left  = nil
    @right = nil
  end

  def add_left(input)
    unless left
      @left = Node.new(input)
    else
      left.insert(input)
    end
  end

  def add_right(input)
    unless right
      @right = Node.new(input)
    else
      right.insert(input)
    end
  end

  def insert(input)
    case
    when input > data
      add_right(input)
    when input < data || input == data
      add_left(input)
    end
  end

  def data
    value
  end

  def all_data
    all = [data]
    all.push left.all_data if left
    all.push right.all_data if right
    all
  end

end
