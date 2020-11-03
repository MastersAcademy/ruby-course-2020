class Tamagotchi

  attr_accessor :name, :health, :hunger, :thirst, :fatigue

  def initialize(name)
    @name = name
    @health = 10
    @hunger = 2
    @thirst = 2
    @fatigue = 0
  end

  def check_health
    if @hunger == 0 || @thirst == 0
      @health += 1
    elsif @hunger >= 7 || @thirst >= 7
      @health -= 1
    end
    if @fatigue == 10
      @health = 0
    elsif  @fatigue >=7
      @health -= 2
    end

  end
  def feed
    check_health
    @hunger -= 1
  end
  def drink
    check_health
    @thirst -= 1
  end
  def play
    check_health
    @fatigue += 2
    @hunger += 1
    @thirst += 1

  end
  def sleep
    check_health
    @fatigue -= 1
    @hunger += 2
    @thirst += 2
  end

  def is_dead?(action_with_pet)
    if @health <= 0
      true
    else
      puts action_with_pet
      false
    end
  end
  def get_characteristics
    puts "PET CHARACTERISTICS
Name: #{name}.
Health: #{health} points.
Hunger: #{hunger} points.
Thirst: #{thirst} points.
Fatigue: #{fatigue} points."
  end

end
puts "Lets pick up a name for your new pet. Please enter a name"
name = gets.chomp
pet = Tamagotchi.new(name)

def get_news(news_is_sad)
  news_is_sad
  if news_is_sad
    puts "Sorry, your pet is dead =("
  end
end
puts "Now you can have fun with your #{name}!"
loop do
  break if pet.is_dead?("")
  pet.get_characteristics
  puts '-' * 60
  puts "You can feed your #{name} (enter 'feed').
You can get some water to your #{name} (enter 'drink').
You can play with your #{name} (enter play).
You can send your #{name} to sleep (enter sleep).
If you want to finish the program enter 'exit'"
  puts '-' * 60
  input = gets.chomp.downcase

  case input
  when "feed"
    pet.feed
    get_news(pet.is_dead?("You fed your pet.".chomp))
  when "drink"
    pet.drink
    get_news(pet.is_dead?("You gave some water to your pet."))
  when "play"
    pet.play
    get_news(pet.is_dead?("You played different games with your pet."))
  when "sleep"
    pet.sleep
    get_news(pet.is_dead?("Your pet is sleeping now"))
  when "exit"
    break
  else
    puts "That is not valid command!"
  end
end


