class Bst

  attr_reader :data
  attr_accessor :left, :right

  def initialize(input)
    @data = input
  end

  def each
    all_data.each { |data| yield data }
  end

  def insert(input)
    case
    when input > data
      insert_or_create(:right, input)
    when input < data || input == data
      insert_or_create(:left, input)
    end
  end

  private

  def insert_or_create(leaf, new_data)
    if send(leaf)
      send(leaf).insert(new_data)
    else
      send("#{leaf}=", Bst.new(new_data))
    end
  end

  protected

  def all_data
    [data, left_data, right_data].flatten.sort
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
