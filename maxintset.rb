class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end

  def insert(value)
    @store[value] = true
  end

  def remove(value)
    @store[value] = false
  end

  def include?(value)
    @store[value] == true
  end

end

class IntSet
  def initialize
    @store = Array.new(20) {[]}
  end

  def insert(value)
    lookup = value % 20
    @store[lookup] << value
  end

  def remove(value)
    lookup = value % 20
    @store[lookup].delete(value)
  end

  def include?(value)
    lookup = value % 20
    @store[lookup].include?(value)
  end


end
