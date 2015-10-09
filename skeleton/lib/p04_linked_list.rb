require 'byebug'

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
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    each do |link|
      return link if link.next == nil
    end

    nil
  end

  def empty?
    @head.key.nil?
  end

  def get(key)
    each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    if empty?
      @head = new_link
    else
      last.next = new_link
    end

  end

  def remove(key)
    unless head.next.nil?
      each do |link|
        if link.next == nil
          @head = Link.new
        elsif link.next.key == key
          link.next = link.next.next
          break
        end
      end
    end
    @head = first

    nil
  end

  def each
    curr_link = @head
    until curr_link.next.nil?
      yield(curr_link)
      curr_link = curr_link.next
    end
    yield(curr_link)
    self

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
