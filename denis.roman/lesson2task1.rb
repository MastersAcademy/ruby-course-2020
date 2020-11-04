class Tamagochi

  ALLOWED = %w[play feed drink]

  def initialize(health = 100, hunger = 0, thirst = 0)
    @health = health
    @hunger = hunger
    @thirst = thirst
  end

  def start
    loop do
      puts 'Choose an action with your pet'
      action = gets.chomp
      ALLOWED.include?(action) ? send(action) : start_error
      break if @health.eql? 0
      status
    end
  end

  def status
    puts "Pet status: #{@health} health, #{@hunger} hunger and #{@thirst} thirst."
  end

  def play
    @hunger += 20
    @thirst += 20
    @health -=15
    puts "You and your pet playing. He is tired and lose some health :("
    death_check
  end

  def feed
    @health += 20
    @hunger -= 50
    puts "Your pet eats"
    fullness_check
  end

  def drink
    @health += 10
    @thirst -= 50
    puts "Your pet drinks"
    fullness_check
  end

  private

  def start_error
    puts 'This command doesnt exist. Use only one of these: play, feed, drink.'
  end

  def death
    @health = 0
    @thirst = 0
    @hunger = 0
    puts 'Your pet has died.'
  end

  def death_check
    death unless @hunger <= 100 && @thirst <= 100
  end

  def full
    puts "Stop feed or drink your pet, it's full and will be die if you dont stop"
  end

  def fullness_check
    full unless @hunger >= 0 && @thirst >= 0
    death if @hunger < -150 || @thirst < -150
   end

end
puts "If you wanna have pet longer,dont let him hunger of thirst>100 or <150 and check his health!"
pet = Tamagochi.new
pet.start