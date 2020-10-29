class Tamagochi

  def initialize(health = 90, hunger = 0, thirst = 0)
    @health = health
    @hunger = hunger
    @thirst = thirst
  end

  def rules
    puts 'Your pet has a hunger/thirst scale of -90..90 and a health scale of 0..90.'\
         ' Each action changes one or several of these values. When any boundary of'\
         ' hunger/thirst is surpassed or health hits 0, your pet dies.'
  end

  def state
    puts "Your pet has #{@health} health, #{@hunger} hunger and #{@thirst} thirst."
  end

  def play
    @hunger += 30
    @thirst += 30
    puts "You've played with your pet."
    sickness_check
    death_check
  end

  def eat
    @health += 10
    @hunger -= 30
    puts "You've fed your pet."
    fullness_check
  end

  def drink
    @health += 5
    @thirst -= 30
    puts "You've hydrated your pet."
    fullness_check
  end

  def death
    @health = 0
    @thirst = 0
    @hunger = 0
    puts 'Your pet has died.'
  end

  def full
    puts "Stop shoving food/drinks into your pet, it's full, play with it instead."
  end

  private

  def death_check
    death unless @hunger <= 90 && @thirst <= 90
  end

  def fullness_check
    full unless @hunger >= 0 && @thirst >= 0
    death if @hunger < -90 || @thirst < -90
    @health = 90 unless @health <= 90
  end

  def sickness_check
    @health -= 30 if rand(1..100) > 90
  end
end

pet = Tamagochi.new

loop do
  puts 'What do you want to do with your pet?'
  action = gets.chomp.upcase
  case action
  when 'RULES'
    pet.rules
  when 'STATE'
    pet.state
  when 'PLAY'
    pet.play
  when 'FEED'
    pet.eat
  when 'HYDRATE'
    pet.drink
  else puts 'Your command is incorrect.'\
       ' Try to use one of these: rules, state, play, feed, hydrate.'
  end
  break if pet.instance_variable_get(:@health).eql? 0

  pet.state
end
