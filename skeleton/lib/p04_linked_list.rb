class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
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
    new_link = Link.new(key, val)
    if empty?
      remove(0)
      @head = new_link
    end

    @list.last.next = new_link unless empty?
    @list << new_link


  end

  def remove(key)
    @list.each do |link|
      if link.key == key
        @list.delete(link)
      end
    end

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
