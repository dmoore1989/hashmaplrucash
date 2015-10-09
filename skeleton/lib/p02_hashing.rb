require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_arr = map.with_index do |el,i|
      string = el.hash.to_s + i.to_s
      string = string[1..-1]
    end
    hash_arr.join("").to_i
  end
end

class String
  def hash
    hash_str = ""
    each_char { |char| hash_str << char.ord.to_s }
    hash_str.to_i
  end
end

class Hash
  def hash
    hash_hsh = []
    keys.sort.each do |key|
      hash_hsh << key.hash.to_s + self[key].hash.to_s
    end
    hash_hsh.join("").to_i

  end
end
