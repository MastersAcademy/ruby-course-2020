def dup(array_str)
  array_str.map! { |str| str.squeeze}
end

raise unless dup(['rrrrrrrruuuuubybyyyyyyyyyy','piccaninny','hubbubbubboo']).eql?(['rubyby','picaniny','hubububo'])
raise unless dup(['abracadabra','allottee','assessee']).eql?(['abracadabra','alote','asese'])
raise unless dup(['kelless','keenness']).eql?(['keles','kenes'])
raise unless dup(['Woolloomooloo','flooddoorroommoonlighters','chuchchi']).eql?(['Wolomolo','flodoromonlighters','chuchchi'])
raise unless dup(['adanac','soonness','toolless','ppellee']).eql?(['adanac','sones','toles','pele'])
raise unless dup(['callalloo','feelless','heelless']).eql?( ['calalo','feles','heles'])
raise unless dup(['putteellinen','keenness']).eql?(['putelinen','kenes'])
raise unless dup(['kelless','voorraaddoosspullen','achcha']).eql?(['keles','voradospulen','achcha'])
raise unless dup([]).eql?([])