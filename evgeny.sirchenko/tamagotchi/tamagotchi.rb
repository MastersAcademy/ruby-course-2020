class Pet
  attr_accessor :name, :health, :satiety, :joy, :rest

  def initialize (name, health, satiety, joy, rest )
    @name = name
    @health = health
    @joy = joy
    @rest = rest
    @satiety = satiety
  end
  print "Hey -_- \nLet me obey you"
  puts ""
  pet = Pet.new(name, 100, 100, 100, 100)
  puts "\nhealth\t#{pet.health} | satiety\t#{pet.satiety} | rest\t#{pet.rest} | joy\t#{pet.joy}"
  begin
    print "-------------------"
    puts "\n|health\t#{pet.health -= rand(20)}|\n|satiety\t#{pet.satiety -= rand(20)}|\n|rest\t#{pet.rest -=rand(20)}|\n|joy\t#{pet.joy -= rand(20)}|"
    print "-------------------"
    puts "\nYour move owner?
1 to heal
2 to feed
3 to let sleep
4 to play
Press Enter to watch your pet messing around..."

    if pet.health != 0
      action = gets.chomp().to_s
      case action
      when "1"
        if pet.health > 0
          pet.health = 100
        end
        pet.satiety  -= rand(20)
        pet.rest -= rand(20)
        pet.joy -= rand(20)
        print "Still alive!"
      when "2"
        pet.health -= rand(20)
        if pet.satiety > 0
          pet.satiety = 100
        end
        pet.rest -= rand(20)
        pet.joy -= rand(20)
        print "Nervously chewing..."
      when "3"
        pet.health -= rand(20)
        pet.satiety -= rand(20)
        if pet.rest > 0
          pet.rest = 100
        end
        pet.joy -= rand(20)
        print "zzzZZZ(DND)"
      when "4"
        pet.health -= rand(20)
        pet.satiety -= rand(20)
        pet.rest -= rand(20)
        if pet.joy > 0
          pet.joy= 100
        end
        print "Having fun in chaos"
      when ""
        pet.health -= rand(20)
        pet.satiety -= rand(20)
        pet.rest -= rand(20)
        pet.joy -= rand(20)
      else
        puts "I dont obey to such a command #{action}, human please"
        print "Owner?! "
        next
      end
      if pet.health <= 0
        pet.health = 0
        print "\n\The soul is lost in infinite search of a better owner..."
      elsif pet.satiety <= 0
        pet.satiety = 0
        print "\n\Think of someone elses stomach even a virtual one!"
      elsif pet.rest <= 0
        pet.rest = 0
        print "\n\Full of irritation and anxiety losing a sober mind and sanity"
      elsif pet.joy <= 0
        pet.joy = 0
        print "\n\You better learn to take care of yourself and then we talk again."
      end

      puts "\nHealth\t#{pet.health}\nSatiety\t\t#{pet.satiety}\nRest\t#{pet.rest}\nJoy\t\t#{pet.joy}"

    end  while pet.health > 0 && pet.satiety > 0 && pet.rest > 0 && pet.joy > 0

    #
    # break
  end
end