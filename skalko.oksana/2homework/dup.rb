def dup(arr)
  result = []
  while arr.size != 0
    str = arr.shift
    array = str.chars
    interim_result = []
    interim_result << array.shift
    while array.size != 0
      if interim_result[-1].eql? array[0]
        array.shift
      else
        interim_result << array.shift
      end
    end
    result_string = interim_result.join
    result << result_string
  end
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
