def sum_to(num)
    return nil if num < 0
    return 1 if num == 1
    num += sum_to(num - 1)
end

def add_numbers(arr)
    return nil if arr.empty?
    return arr.first if arr.length == 1
    arr[0] += add_numbers(arr[1..-1])
end

def gamma_fnc(num)
    return nil if num == 0
    return 1 if num == 1
    (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0..-2])
end