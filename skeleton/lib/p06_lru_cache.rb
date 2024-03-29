require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      value = @store.get(key)
      @store.remove(key)
      @store.insert(key, value)
      @map.get(key)
    else
      value = @prc.call(key)
      @store.insert(key, value)
      @map.set(key, value)
      if count > @max
        eject!
      end
      value
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key

  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!

  end
end
