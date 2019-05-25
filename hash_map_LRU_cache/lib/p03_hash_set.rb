  
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if !include? key
      @count += 1
      if count > num_buckets
        resize!
      end
        @store[num % num_buckets] << key
        true
    end
    return false
  end

  def include?(key)
    num = key.hash
    @store[num % num_buckets].include?(key)
  end

  def remove(key)
    if include? key
     num = key.hash
    @store[num % num_buckets].delete(key)
    @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
