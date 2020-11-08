class Tamagochi

  ALLOWED = %w[play feed drink].freeze

  ERRORS = {
      command_error: 'This command doesnt exist. Use only one of these: play, feed, drink',
      filling_error: 'Stop feed or drink your pet, it s full and will be die if you dont stop'
  }.freeze

  ACTIVITY = {
      choose: 'Choose an action with your pet',
      playing: 'You and your pet playing. He is tired and lose some health :(',
      feeding: 'Your pet eats',
      drinking: 'Your pet drinks',
      death_const: 'Your pet has died.',
      rule: 'If you wanna have pet longer,dont let him hunger of thirst>100 or <-150 and check his health!'
  }.freeze

  def initialize(health = 100, hunger = 0, thirst = 0)
    @health = health
    @hunger = hunger
    @thirst = thirst
  end

  def start
    puts ACTIVITY[:rule]
    loop do
      puts ACTIVITY[:choose]
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
    puts ACTIVITY[:playing]
    death_check
  end

  def feed
    @health += 20
    @hunger -= 50
    puts ACTIVITY[:feeding]
    death_check
  end

  def drink
    @health += 10
    @thirst -= 50
    puts ACTIVITY[:drinking]
    death_check
  end

  private

  def start_error
    puts ERRORS[:command_error]
  end

  def death
    @health = 0
    @thirst = 0
    @hunger = 0
    puts ACTIVITY[:death_const]
  end

  def full
    puts ERRORS[:filling_error]
  end

  def death_check
    full unless @hunger >= 0 && @thirst >= 0
    death if @hunger < -150 || @thirst < -150 || @hunger >= 100 && @thirst >= 100
  end

end
pet = Tamagochi.new
pet.start
