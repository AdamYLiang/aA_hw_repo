class Octopus 
    attr_reader :fish, :tiles
    def initialize 
        @fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
        @tiles = tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
    end

    #O(n^2)
    def sluggish_eat
        longest_fish = nil
        @fish.each_with_index do |el, idx|
            next if idx == @fish.length - 1
            @fish.each_with_index do |el2, idx2|
                if el.length > el2.length
                    longest_fish = el 
                else
                    longest_fish = el2
                end
            end
        end
        longest_fish
    end

    #O(n log n), mergesort it
    def dominant_eat(fishes)
        prc = Proc.new { |x, y| y.length <=> x.length}
        largest_sorted = fish.merge_sort(&prc)
        largest_sorted[0]
    end

    #O(n)
    def clever_eat
        longest_fish = nil
        @fish.each do |el|
            longest_fish == el if el.length > longest_fish.length
        end
        longest_fish
    end

    def slow_dance(dir, tiles_arr)
    end

    def constant_dance(dir, tiles_arr)
    end
end

class Array 

    def merge_sort(&prc) 
        prc ||= Proc.new { |x,y| x <=> y}
        return self if self.length < 2
        middle = self.length / 2
        left, right = take(middle).merge_sort(&prc), drop(middle).merge_sort(&prc)
        Array.merge(left, right, &prc)
    end

    def merge(left, right, &prc)
        result = []

        until left.empty? || right.empty?
            if prc.call(left, right) == -1 
                result << left.shift
            else 
                result << right.first
            end
        end

        result + left + right
    end

end