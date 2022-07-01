require_relative "00_tree_node.rb"
require 'byebug'

class KnightPathFinder

    POSSIBLEMOVE = [[2, 1],[2,-1], [-2, 1], [-2, -1], [1,2], [-1, 2], [1, -2], [-1,-2]]

    def self.valid_moves(pos)
     
        i = pos[0]
        j = pos[1]
        temp = POSSIBLEMOVE.map do |subArr|
            newi = i + subArr[0]
            newj = j + subArr[1]
            [newi, newj]
        end
        real_moves = []
        temp.each.with_index do |move,i|
            real_moves << move if move.all?{|num| num >= 0 && num < 8}
        end

        real_moves

      
    end
        



    def initialize(pos)
        @board = Array.new(8) {Array.new(8) {PolyTreeNode.new('_')}}
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @current_pos = pos
        @considered_pos = [@pos]
        @starting_pos = PolyTreeNode.new(pos)
    end

    def new_move_positions(pos)
        valid = KnightPathFinder.valid_moves(pos)
        filtered = []

        valid.each do |position|
            if !@considered_pos.include?(position)
                filtered << position
            end
        end

        @considered_pos += filtered
        filtered
    end
    




end