# frozen_string_literal: true

def dup(arr)
  result = []
  arr.each  do |el|
    array = []
    el.each_char do |char|
      array << char if array.last != char
    end
    result << array.join
  end
  p result
end

dup(%w[rrrrrrrruuuuubybyyyyyyyyyy piccaninny hubbubbubboo])
dup(%w[rrrrrrrruuuuubybyyyyyyyyyy piccaninny hubbubbubboo]).eql?(%w[rubyby picaniny hubububo])
raise unless dup(%w[abracadabra allottee assessee]).eql?(%w[abracadabra alote asese])
raise unless dup(%w[kelless keenness]).eql?(%w[keles kenes])
raise unless dup(%w[Woolloomooloo flooddoorroommoonlighters chuchchi]).eql?(%w[Wolomolo flodoromonlighters chuchchi])
raise unless dup(%w[adanac soonness toolless ppellee]).eql?(%w[adanac sones toles pele])
raise unless dup(%w[callalloo feelless heelless]).eql?(%w[calalo feles heles])
raise unless dup(%w[putteellinen keenness]).eql?(%w[putelinen kenes])
raise unless dup(%w[kelless voorraaddoosspullen achcha]).eql?(%w[keles voradospulen achcha])
raise unless dup([]).eql?([])
