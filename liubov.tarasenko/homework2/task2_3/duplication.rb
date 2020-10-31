def dup(arr)
  result = []
  arr.each{|el| 
    array = []
    el.each_char{|char|
      array << char if array.last != char
    }
    result << array.join
  }
  p result
end

dup(['rrrrrrrruuuuubybyyyyyyyyyy','piccaninny','hubbubbubboo'])
dup(['rrrrrrrruuuuubybyyyyyyyyyy','piccaninny','hubbubbubboo']).eql?(['rubyby','picaniny','hubububo'])
raise unless dup(['abracadabra','allottee','assessee']).eql?(['abracadabra','alote','asese'])
raise unless dup(['kelless','keenness']).eql?(['keles','kenes'])
raise unless dup(['Woolloomooloo','flooddoorroommoonlighters','chuchchi']).eql?(['Wolomolo','flodoromonlighters','chuchchi'])
raise unless dup(['adanac','soonness','toolless','ppellee']).eql?(['adanac','sones','toles','pele'])
raise unless dup(['callalloo','feelless','heelless']).eql?( ['calalo','feles','heles'])
raise unless dup(['putteellinen','keenness']).eql?(['putelinen','kenes'])
raise unless dup(['kelless','voorraaddoosspullen','achcha']).eql?(['keles','voradospulen','achcha'])
raise unless dup([]).eql?([])