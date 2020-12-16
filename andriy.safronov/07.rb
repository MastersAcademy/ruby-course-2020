def left_count(arr, index)
  left = arr.map { |v, _| v if v < index }.compact.max
  left ? index - left - 1 : 0
end

def right_count(arr, index)
  right = arr.map { |v, _| v if v > index }.compact.min
  right ? right - index - 1 : 0
end

def calculate_dist(arr)
  arr.map do |index, char|
    [left_count(arr, index) + right_count(arr, index), char]
  end
end

def loneliest(str)
  ind = []
  str.strip.split('').each.with_index do |char, index|
    ind << [index, char] unless char == ' '
  end
  ind = calculate_dist(ind)
  max = ind.map { |count, _| count }.max
  ind.map { |count, char| char if count == max }.compact
end
