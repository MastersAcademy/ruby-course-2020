def calculate_dist(arr)
  arr.map do |index, char|
    left = arr.map { |v, _| v if v < index }.compact.max
    left_count = left ? index - left - 1 : 0
    right = arr.map { |v, _| v if v > index }.compact.min
    right_count = right ? right - index - 1 : 0
    [left_count + right_count, char]
  end
end
def loneliest(str)
  ind = []
  str.strip.split('').each.with_index do |char, index|
    ind << [index, char] unless char == ' '
  end
  # do not use map!
  ind = calculate_dist(ind)
  max = ind.map { |count, _| count }.max
  ind.map { |count, char| char if count == max }.compact
end
