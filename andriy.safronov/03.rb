class Tamagochi
    def status 
        "Поїсти: #{@eat_time}, Попити: #{@drink_time}, Спати: #{@sleep_time}"
    end 
    def initialize
        @eat_time = 8
        @drink_time = 6
        @sleep_time = 5
    end
    def eat
         @eat_time += 1
         @drink_time -= 1
         "Поїсти"   
    end

    def drink
        @drink_time += 1
        @sleep_time -=1
        "Попити"
    end

   def sleep
    @sleep_time += 1
    @eat_time -= 1
    "Спати"   
    end
end

me = Tamagochi.new
me.eat
me.drink
me.sleep

puts me.status
