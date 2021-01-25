class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index { |ele, i| total += (ele.hash * i.hash) }
    if self.size > 0
      total/self.size
    else
      0.hash
    end
  end
end

class String
  def hash
    total = 0
    # self.chars.map { |char| char.to_sym }
    self.chars.map(&:to_sym).each_with_index { |ele, i| total += (ele.hash * i.hash) }
    if self.size > 0
      total/self.size
    else
      0.hash
    end
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    self.to_a.sort.each_with_index { |ele, i| total += (ele.hash * i.hash) }
    if self.size > 0
      total/self.size
    else
      0.hash
    end
  end
end

