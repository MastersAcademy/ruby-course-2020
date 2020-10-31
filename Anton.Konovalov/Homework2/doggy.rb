class Doggy

  def initialize(name)
    puts 'Hello, name your pet'
    name = gets.chomp
    @name = name
    @health = 70
    @mood = 70
    @hunger = 30
    @tiredness = 30
    @asleep = 70
    @dirty = 20
    @defend = false
    puts "#{@name} started living with you:)"
    user_interaction
  end

  def feed
    puts "You are feeding #{@name}"
    puts "#{@name} liked it:)"
    @hunger = 0
    @health += 10
    @mood += 10
    @asleep -= 10
    user_interaction
  end

  def walk
    puts "You are walking with #{@name}"
    @tiredness += 30
    @mood += 20
    @asleep -= 15
    @dirty += 15
    if @tiredness > 90
      puts "#{@name} wants to sleep"
    end
    user_interaction
  end

  def go_to_sleep
    puts "#{@name} went to sleep"
    puts "Don't forget to feed #{@name} after sleep!"
    @hunger += 50
    @health += 25
    @asleep = 100
    @tiredness = 0
    user_interaction
  end

  def play
    puts "It's so much fun playing with #{@name}!"
    @mood += 30
    @tiredness += 20
    @health += 5
    @hunger += 20
    @dirty += 10
    user_interaction
  end

  def bathe
    puts "Let’s get #{@name} cleaned up!"
    @health += 10
    @hunger += 5
    @mood +=5
    @dirty = 0
    user_interaction
  end

  def scratch
    puts "#{@name} likes to be scratched behind his ear"
    @mood += 20
    user_interaction
  end

  def see_some_stranger
    puts "#{@name} growls and barks"
    @defend = true
    @hunger += 5
    @asleep += 3
    if @hunger >= 70 && @asleep <= 20
      @health -= 5
    end
    user_interaction
  end

  def help
    puts 'You can feed doggy - feed'
    puts 'You can play with him - play'
    puts 'Doggy can be put to sleep - go_to_sleep'
    puts 'You can walk with him - walk'
    puts 'You can bathe doggy - bathe'
    puts 'Doggy likes to be scratched behind his ear - scratch'
    puts 'She can defend - see_some_stranger'
    puts 'You can watch for him - follow'
    puts 'You can check all his stats - status'
    puts 'Show all commands - help'
    user_interaction
  end

  def status
    puts "health = #{@health}"
    puts "mood = #{@mood}"
    puts "hunger = #{@hunger}"
    puts "tiredness = #{@tiredness}"
    puts "asleep = #{@asleep}"
    puts "defend = #{@defend}"
    puts "dirty = #{@dirty}"
    user_interaction
  end

  def follow
    r = rand(1..3)
    case r
    when 1
      puts "#{@name} ran around the room, found the ball and grabbed it:)"
      @mood += 10
      @tiredness += 10
    when 2
      puts "#{@name} walked down the street, met another dog, and they dressed each other up"
      @mood -= 5
      @tiredness += 5
    when 3
      puts "The owner was away all day. When he came, #{@name} was very happy and wagged his tail"
      @mood += 35
      @hunger += 35
      @dirty += 15
    end
    user_interaction
  end

  private

  def user_interaction
    time_passes
    puts "Select the type of interaction with your pet:"
    action = gets.chomp
    action_router(action)
  end

  def action_router(action)
    send(action)
  rescue NoMethodError
    puts 'Wrong command! Please, use help and try again'
    user_interaction
  end

  def time_passes
    @hunger += 5
    @asleep -= 5
    if @asleep < 20
      puts "#{@name} wants to sleep"
      @health -= 3
    end

    if @hunger > 65
      puts "#{@name} is hungry, it's time to eat!"
      @mood -= 5
      @health -= 3
    end

    if @dirty > 50
      puts "#{@name} is dirty, it’s time to bathe!"
      @health -= 5
    end

    if @mood < 30
      puts "#{@name} is bored, play with him"
    end

    if @hunger > 90 || @health < 20
      puts "#{@name} is running away from home because you mistreated him"
      exit
    end
  end
end

doggy = Doggy.new('name')