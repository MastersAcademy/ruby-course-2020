# frozen_string_literal: true

def dup(array)
  array.map { |x| x.gsub(/([a-zA-Z])\1+/, '\1') }
end

