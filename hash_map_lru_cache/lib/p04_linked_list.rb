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
    preceding = self.prev
    proceeding = self.next
    preceding.next = proceeding
    proceeding.prev = preceding
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

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
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    self.each do |node| 
      if node.key == key
        return node.val 
      end
    end
  end

  def include?(key)
    self.each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    appendingnode = Node.new(key, val)
    self.last.next =  appendingnode
    appendingnode.prev = self.tail.prev
    appendingnode.next = self.tail 
    self.tail.prev = appendingnode
    appendingnode
  end

  def update(key, val)
    self.each do |node| 
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
      end
    end
  end

  def each
      current_node = self.head.next
      until current_node == self.tail
        yield current_node
        current_node = current_node.next
      end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end