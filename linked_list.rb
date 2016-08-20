class LinkedList

	attr_accessor :head, :tail, :size

	def initialize()
		@size = 0
	end

	def append(value)
		new_node = Node.new(value, nil)
		if @head == nil
			@head = new_node
			@tail = @head
		else
			@tail.next_node = new_node
			@tail = @tail.next_node
		end
		@size += 1
	end

	def prepend(value)
		new_node = Node.new(value, @head)
		@head = new_node
		if @tail == nil
			@tail = @head
		else
			node = @head
			node = node.next_node until node.next_node.nil?
			@tail = node
		end
		@size += 1
	end

	def head()
		return "[ #{@head.value} ]"
	end

	def tail()
		return "[ #{@tail.value} ]"
	end

	def at(index)
		i = 0
		node = @head
		until i == index
			node = node.next_node
			i+=1
		end
		return "[ #{node.value} ]"
	end

	def pop()
		node = @head
		node = node.next_node until node.next_node == @tail
		node.next_node = nil
		@tail = node
		@size -= 1
	end

	def contains?(value)
		node = @head
		until node == nil
			return true if node.value == value
			node = node.next_node
		end
		return false
	end

	def find(value)
		node = @head
		i = 0
		until node == nil
			return i if node.value == value
			node = node.next_node
			i+=1
		end
		return nil
	end

	def to_s
		list = ""
		node = @head
		until node == nil
			list << "( #{node.value} ) -> "
			node = node.next_node
		end
		list << "nil"
		return list
	end

	def insert_at(index, value)
		return prepend(value) if index == 0
		return append(value) if index == @size 
		return puts "INDEX BIGGER THAN LIST!" if index > @size
		new_node = Node.new(value)
		node = @head
		i = 0
		until i == index - 1
			node = node.next_node
			i += 1
		end
		new_node.next_node = node.next_node
		node.next_node = new_node
		@size += 1
	end

	def remove_at(index)
		return pop() if index == @size - 1
		return puts "INDEX BIGGER THAN LIST!" if index > @size - 1
		node = @head
		i = 0
		if index == 0
			@head = @head.next_node
		else
			until i == index - 1
				node = node.next_node
				i += 1
			end
			node.next_node = node.next_node.next_node
		end
		@size-=1
	end
end

class Node

	attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end

end

linked_list = LinkedList.new()
linked_list.append(2)
linked_list.prepend(1)
linked_list.prepend(0)
linked_list.prepend("start")
linked_list.append("remove_me")
linked_list.append(3)
linked_list.append("popper")
p linked_list.to_s
linked_list.pop()
p linked_list.to_s
linked_list.append("finish")
p linked_list.to_s
p linked_list.contains?("remove_me")
linked_list.remove_at(4)
p linked_list.contains?("remove_me")
p linked_list.to_s
p linked_list.size
p linked_list.head
p linked_list.tail