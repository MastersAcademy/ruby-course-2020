# frozen_string_literal: true

def loneliest(str)
  groups = str.strip.split(/(?=(\s*\w\s*))/)
  max = groups.map(&:length).max
  groups.select { |x| x.size.eql? max }.map(&:strip).uniq
end
