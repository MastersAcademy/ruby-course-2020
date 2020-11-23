# frozen_string_literal: true

def dashatize(num)
  num.abs.digits.reverse.slice_when { |a, b| a.odd? || b.odd? }.map(&:join).join('-')
end

# for example
p dashatize(-28_369)
p dashatize(274)
