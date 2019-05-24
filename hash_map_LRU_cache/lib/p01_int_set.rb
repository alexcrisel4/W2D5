class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !include? num
      @count += 1
      if count > num_buckets
        resize!
      end
        @store[num % num_buckets] << num
        true
    end
    return false
  end

  def remove(num)
   if @store[num % num_buckets].include?(num)
    @count -= 1
   end
   @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include? num 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
     new_store = Array.new(2 * num_buckets) { Array.new }
        for bucket in @store
          for ele in bucket
            new_store[ele % (2 * num_buckets)] << ele
          end
        end
        @store = new_store
  end
end
