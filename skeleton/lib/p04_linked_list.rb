class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil,prev =nil)
    @key, @val, @next, @previous = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @list = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self[0]
  end

  def last
    self[@list.count - 1]
  end

  def empty?
    @list.empty?
  end

  def get(key)
    @list.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    @list.each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    prev_link = last
    new_link = Link.new(key, val, nil, prev_link)
    if empty?
      remove(0)
    end

    @list.last.next = new_link unless empty?
    @list << new_link
    @tail = new_link


  end

  def remove(key)
    @list.each_with_index do |link,idx|
      if link.key == key
        @list.delete(link)
        @list[idx-1].next = @list[idx]
        @list[idx+1].prev = @list[idx]
        break
      end
    end
    @head = first
    @tail = last
    nil
  end

  def each
    @list.each do |link|
      yield(link)
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
