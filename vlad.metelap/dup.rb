def dup(array_str)
  array_str.map! do |str|
    pred_char = ''
    str_result = ''
    str.chars.map do |char|
      if pred_char != char
        str_result += char
        pred_char = char
      end
    end
    str_result
  end
end

array_str1 = dup(%w(qwwwwwwwweeeee zadddvvrh))
puts "Test: #{array_str1.inspect}"

raise unless dup(['rrrrrrrruuuuubybyyyyyyyyyy', 'piccaninny', 'hubbubbubboo']).eql?(['rubyby', 'picaniny', 'hubububo'])
raise unless dup(['abracadabra', 'allottee', 'assessee']).eql?(['abracadabra', 'alote', 'asese'])
raise unless dup(['kelless', 'keenness']).eql?(['keles', 'kenes'])
raise unless dup(['Woolloomooloo', 'flooddoorroommoonlighters', 'chuchchi']).eql?(['Wolomolo', 'flodoromonlighters', 'chuchchi'])
raise unless dup(['adanac', 'soonness', 'toolless', 'ppellee']).eql?(['adanac', 'sones', 'toles', 'pele'])
raise unless dup(['callalloo', 'feelless', 'heelless']).eql?( ['calalo', 'feles', 'heles'])
raise unless dup(['putteellinen', 'keenness']).eql?(['putelinen', 'kenes'])
raise unless dup(['kelless', 'voorraaddoosspullen', 'achcha']).eql?(['keles', 'voradospulen', 'achcha'])
raise unless dup([]).eql?([])
