class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 528734985762348957 if empty? 
    inject do |accum, ele| (528734985762348957)
      accum ^ Integer(ele.to_s(2))
    end
  end
end



class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
