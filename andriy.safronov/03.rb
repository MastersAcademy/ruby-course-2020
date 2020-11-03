class Tamagochi
  def status 
    "EAT: #{@eat_time}, DRINK: #{@drink_time}, SLEEP: #{@sleep_time}"
  end 

  def initialize
    @eat_time = 8
    @drink_time = 6
    @sleep_time = 5
  end

  def eat
    @eat_time += 1
    @drink_time -= 1
    "EAT"   
  end

  def drink
    @drink_time += 1
    @sleep_time -=1
    "DRINK"
  end

  def sleep
    @sleep_time += 1
    @eat_time -= 1
    "SLEEP"   
  end
end

dog = Tamagochi.new
dog.eat
dog.drink
dog.sleep

puts dog.status
