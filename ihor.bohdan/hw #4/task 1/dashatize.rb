# frozen_string_literal: true

def dashatize(num)
  num ? num.to_s.scan(/[02468]+|[13579]/).join('-') : nil
end
