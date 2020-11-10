class Pet
   
  def initialize(name)
    puts 'Enter name your pet: '
    name = gets.chomp
    @name = name
    @health = 80
    @hunger= 79
    @play = 75
    @asleep = 55
    puts "#{@name} was Born!"
    user_interaction
  end
  
  def feed
    puts "#{@name} eats!"
    @hunger += 5
    @health += 3
    @play += 3
    @asleep -= 2
    user_interaction
  end

  def go_to_sleep
    puts "#{@name} went to sleep"
    @hunger -= 2
    @health += 3
    @asleep += 5
    @play -= 1
    user_interaction
  end

  def play
    puts "It's so much fun playing with #{@name}!"
    @play += 3
    @health += 1
    @hunger -= 2
    @asleep -= 1
    user_interaction
  end

  def walk
    puts "#{@name} walking!"
    @health += 3
    @play += 2
    @asleep -= 1
    @hunger -= 1
    user_interaction
  end

  def help
    puts 'You can feed doggy - feed'
    puts 'You can play with him - play'
    puts 'Doggy can be put to sleep - go_to_sleep'
    puts 'You can walk with him - walk'
    puts 'You can check all his stats - status'
    puts 'Show all commands - help'
    user_interaction
  end

  def status
    puts "health = #{@health}"
    puts "hunger = #{@hunger}"
    puts "play = #{@play}"
    puts "asleep = #{@asleep}"
    user_interaction
  end

private

  def user_interaction
    time_passes
    puts "What do you want to do with #{@name}:"
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

    if @hunger < 50
      puts "#{@name} time to eat!"
      @play -= 5
      @health -= 3
    end

    if @health < 20
      puts "#{@name} want's to take a walk!"
      @health -= 5
    end

    if @play< 30
      puts "#{@name} want's to play!"
    end

    if @hunger < 15 || @health < 15
      puts "#{@name} died! Game Over!!!"
      exit
    end
  end
end

pet = Pet.new('name') 
