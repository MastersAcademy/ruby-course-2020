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
    if @hunger.zero? || @thirst.zero?
      @health += 1
    elsif @hunger >= 7 || @thirst >= 7
      @health -= 1
    end

    case @fatigue
    when 10
      @health = 0
    when 7...10
      @health -= 2
    end
  end

  def feed(check)
    check_health
    @hunger -= 1
    puts 'You fed your pet.' if check == false
  end

  def drink(check)
    check_health
    @thirst -= 1
    puts 'You gave some water to your pet.' if check == false
  end

  def play(check)
    check_health
    @fatigue += 2
    @hunger += 1
    @thirst += 1
    puts 'You played different games with your pet.' if check == false
  end

  def sleep(check)
    check_health
    @fatigue -= 1
    @hunger += 2
    @thirst += 2
    puts 'Your pet is sleeping now.' if check == false
  end

  def dead?
    if @health <= 0
      puts 'Sorry, your pet is dead =('
      true
    end
  end

  def characteristics
    puts(<<-PET_CHARACTERISTICS)
      PET CHARACTERISTICS
      Name: #{name}.
      Health: #{health} points.
      Hunger: #{hunger} points.
      Thirst: #{thirst} points.
      Fatigue: #{fatigue} points.
    PET_CHARACTERISTICS
  end
end

puts 'Lets pick up a name for your new pet. Please enter a name'
name = gets.chomp
pet = Tamagotchi.new(name)

puts "Now you can have fun with your #{name}!"
loop do
  break if pet.dead?
  pet.characteristics
  puts '-' * 60
  puts(<<-MENU)
    You can feed your #{name} (enter 'feed').
    You can get some water to your #{name} (enter 'drink').
    You can play with your #{name} (enter play).
    You can send your #{name} to sleep (enter sleep).
    If you want to finish the program enter 'exit'
  MENU
  puts '-' * 60
  input = gets.chomp.downcase

  case input
  when 'feed'
    pet.feed(pet.dead?)
  when 'drink'
    pet.drink(pet.dead?)
  when 'play'
    pet.play(pet.dead?)
  when 'sleep'
    pet.sleep(pet.dead?)
  when 'exit'
    break
  else
    puts 'That is not valid command!'
  end
end


