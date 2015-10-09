class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_arr = map.with_index do |el,i|
      el.hash.to_s + i.to_s
    end
    hash_arr.join("").to_i
  end
end

class String
  def hash
  end
end

class Hash
  def hash
  end
end
