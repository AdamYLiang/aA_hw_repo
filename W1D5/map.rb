class Map
    attr_accessor :map_arr

    def initialize 
        @map_arr = []
    end

    def set(key, value)

        map_arr.each_with_index do |el, idx|
            if el[0] == key
                map_arr[idx] = [key, value]
                return
            end
        end

        map_arr << [key, value]
    end

    def get(key)
        map_arr.each do |el|
            if el[0] == key
                return el[1]
            end
        end
    end

    def delete(key)
        map_arr.each_with_index do |el, idx|
            if el[0] == key
                map_arr.delete_at(idx)
            end
        end
    end

    def show
        map_arr.map do |el|
            "#{el[0]} => #{el[1]}"
        end
    end

end