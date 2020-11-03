class Pet
 attr_accessor :name, :health, :eat, :play, :sleep
 
def initialize (name, health, eat, play, sleep )
    @name = name
    @health = health  
    @play = play
    @sleep = sleep 
    @eat = eat
  end
print "Hello!\nMy name is Floopy"
puts ""
pet = Pet.new(name, 100, 100, 100, 100)
puts "\nHealth\t#{pet.health} | Eat\t#{pet.eat} | Sleep\t#{pet.sleep} | Play\t#{pet.play}"
begin
  print "-------------------"
  puts "\n|Health\t#{pet.health -= rand(20)}|\n|Eat\t#{pet.eat -= rand(20)}|\n|Sleep\t#{pet.sleep -=rand(20)}|\n|Play\t#{pet.play -= rand(20)}|"
  print "-------------------"
  puts "\nWhat do we do?

Press 1 - Go to doctor
Press 2 - Feed
Press 3 - Put to sleep
Press 4 - Play
Press Enter to do nothing..."

    if pet.health != 0
  diya = gets.chomp().to_s
    case diya
    when "1"
              if pet.health > 0
            pet.health = 100
           end
         pet.eat -= rand(20)
         pet.sleep -= rand(20)
         pet.play -= rand(20)
         print "Floopy being treated!"
      when "2"
                 pet.health -= rand(20)
        if pet.eat > 0
            pet.eat = 100
          end
         pet.sleep -= rand(20)
         pet.play -= rand(20)
        print "Floopy eats!"
      when "3"
                pet.health -= rand(20)
        pet.eat -= rand(20)
        if pet.sleep > 0
            pet.sleep = 100
          end
        pet.play -= rand(20)
        print "Floopy is sleeping!"
    when "4"
              pet.health -= rand(20)
        pet.eat -= rand(20)
        pet.sleep -= rand(20)
        if pet.play > 0
            pet.play = 100
          end
        print "Floopy plays!"
    when ""
                pet.health -= rand(20)
        pet.eat -= rand(20)
        pet.sleep -= rand(20)
        pet.play -= rand(20)
    else
      puts "You entered #{diya}, something wrong!"
      print "Try again! "
      next
    end
  if pet.health <= 0
      pet.health = 0
        print "\n\Floopy died of disease !!! Game Ower!"
  elsif pet.eat <= 0
      pet.eat = 0
        print "\n\Floopy died of hunger !!! Game Ower!"
  elsif pet.sleep <= 0
      pet.sleep = 0
        print "\n\Floopy died of sleeplessness !!! Game Ower!"
  elsif pet.play <= 0
      pet.play = 0
        print "\n\Floopy died of boredom !!! Game Ower!"
end
 
puts "\nHealth\t#{pet.health}\nEat\t\t#{pet.eat}\nSleep\t#{pet.sleep}\nPlay\t\t#{pet.play}"
  
  end  while pet.health > 0 && pet.eat > 0 && pet.sleep > 0 && pet.play > 0
     
          #       
          # break        
end 
end
