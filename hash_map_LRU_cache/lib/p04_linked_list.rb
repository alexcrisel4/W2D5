class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
     @head.next == @tail
  end

  def get(key)
    node = @head.next
    while node.next
      if node.key == key
        return node.val
      end
      node = node.next
    end
    nil
  end

  def include?(key)
    node = @head.next
    while node.next
      if node.key == key
        return true
      end
      node = node.next
    end
    false
  end

  def append(key, val)
    old_end = @tail.prev 
    new_node = Node.new(key, val)
    old_end.next = new_node
    new_node.next = @tail
    new_node.prev = old_end
    @tail.prev = new_node
    
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each(&blk)
    node = @head.next
    while node.next
      blk.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
