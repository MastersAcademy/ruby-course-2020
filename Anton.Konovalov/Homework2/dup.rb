# frozen_string_literal: true

def dup(str)
  str.collect { |s| s.chars.chunk { |c| c }.collect(&:first).join }
end

# for example
p dup(['aaaaabraaaa'])
p dup(%w[kelless keenness])
