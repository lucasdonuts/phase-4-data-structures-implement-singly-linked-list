require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(node)
    if head
      node.next_node = self.head
      self.head = node
    else
      self.head = node
    end
  end

  def append(node)
    if !head
      self.head = node
      return
    end

    tail.next_node = node
  end

  def delete_head
    self.head = head.next_node if head
  end

  def delete_tail
    if head
      unless head.next_node
        self.head = nil
        return
      end

      node = head

      until node.next_node == tail
        node = node.next_node
      end

      node.next_node = nil
    end
  end

  def add_after(index, node)
    head.next_node = node if index == 0
    target = head
    index.times do
      target = target.next_node unless !target.next_node
    end

    target.next_node = node
  end

  def search(value)
    if head
      node = head
      loop do
        return node if node.data == value
        break if !node.next_node
        node = node.next_node
      end
    else
      return
    end
  end

  def tail
    tail = head
    while tail.next_node
      tail = tail.next_node
    end
    tail
  end

end
