class Bst

  attr_reader :data, :left, :right

  def initialize(input)
    @data = input
  end

  def each
    all_data.each do |value|
      yield value
    end
  end

  def all_data
    all = [data]
    all.push left.all_data if left
    all.push right.all_data if right
    all.flatten.sort
  end

  def insert(input)
    case
    when input > data
      add_right(input)
    when input < data || input == data
      add_left(input)
    end
  end

  def add_left(input)
    unless left
      @left = Bst.new(input)
    else
      left.insert(input)
    end
  end

  def add_right(input)
    unless right
      @right = Bst.new(input)
    else
      right.insert(input)
    end
  end

end
