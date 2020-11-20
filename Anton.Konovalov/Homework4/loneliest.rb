# frozen_string_literal: true

def count_spaces(arr, elem)
  index = arr.index(elem)
  before_counter = 0
  after_counter = 0
  arr.take(index).reverse.each { |el| el.strip.empty? ? before_counter += 1 : break }
  arr[index..].drop(1).each { |el| el.strip.empty? ? after_counter += 1 : break }
  before_counter + after_counter
end

def loneliest(str)
  arr = str.strip.split('')
  non_empty = arr.reject(&:empty?)
  hash = non_empty.map { |el| [el, count_spaces(arr, el)] }.to_h
  max_value = hash.sort_by { |el| el[1] }.reverse.first[1]
  hash.sort.map { |elem| elem[0] if elem[1].eql? max_value }.compact
end

p loneliest('  abc  d  z    f gk s ').sort
