class Bst

  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def each
    all_data.each { |data| yield data }
  end

  def insert(new_data)
    new_data > data ? add_right(new_data) : add_left(new_data)
  end

  private

  def add_right(new_data)
    right ? right.insert(new_data) : self.right = Bst.new(new_data)
  end

  def add_left(new_data)
    left ? left.insert(new_data) : self.left = Bst.new(new_data)
  end

  protected

  def all_data
    [left_data, data, right_data].flatten
  end

  def left_data
    return [] unless left
    left.all_data
  end

  def right_data
    return [] unless right
    right.all_data
  end


end
