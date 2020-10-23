def matrix
  el = Random.new 
  arr1 = []
  arr2 = []
  3.times do
    3.times{arr1 << el.rand(-10..10)}
    arr2 << arr1
    arr1 = []
  end
  p arr2
  arr3= arr2.flatten
  summ = 0
  arr3.each{|el|
    if (el > 0)
      summ += el 
      puts el 
    end
  }
  p summ
end
