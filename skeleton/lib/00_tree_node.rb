require 'byebug'

class PolyTreeNode
    attr_reader :value, :children, :parent



    def initialize(value)
        @parent = nil
        @children = []
        @value = value

    end


    def parent=(node)
        if node
            self.parent.children.delete(self) if self.parent
            @parent = node
            @parent.children << self if !@parent.children.include?(self)
        else
            @parent = nil
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end 

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise error
        else
            child_node.parent = nil
        end
    end

    def dfs(value)
        return self if self.value == value
        return nil if self.children.length == 0
        arr =  self.children.dup
        

        arr.each do |child|
            var = child.dfs(value)
            return var unless var == nil
        end

        nil
    end


    def bfs(target)
        q = [self]

        while (q.size > 0)
            current_node = q.shift
            return current_node if current_node.value == target
            current_node.children.each {|ele| q << (ele)}
        end

        nil
    end
        

end