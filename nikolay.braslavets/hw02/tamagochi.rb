class Tamagochi
  COMMANDS = %w(help feed play sleeping heal speak praise scold poop scratch claws kicked stat)
  STATICMSG = 'What else will we do? If you forgot the commands, type help on the keyboard'
  def initialize(name)
    @name = name
    @health = 5
    @mood = 10
    @hunger = 9
    @sleep = 7
    @level_of_poop = 5
    @anger = 0
  end

  def help
    f = File.open("help.txt", "r")
    f.each_line do |line|
      puts line
      sleep 0.2
    end
    f.close
  end

  def feed
    puts "I eat. #{STATICMSG}"
    @hunger += rand(1..3)
    @level_of_poop -= rand(1..3)
    some_time_passed
  end

  def play
    puts "I am play. #{STATICMSG}"
    @mood += rand(1..3)
    @hunger -= 1
    @sleep -= 1
    some_time_passed
  end

  def sleeping
    puts "I am sleeping now. #{STATICMSG}"
    @health += 1
    @sleep += rand(1..3)
    some_time_passed
  end

  def heal
    puts "You heel me, thnx. #{STATICMSG}"
    @mood += rand(1..3)
    @health += rand(1..3)
    some_time_passed
  end

  def speak
    puts "You speak with me thnx. #{STATICMSG}"
    @mood += rand(1..2)
    some_time_passed
  end

  def praise
    puts "You praise me. #{STATICMSG}"
    @mood += rand(1..4)
    some_time_passed
  end

  def scold
    puts "You scold me. #{STATICMSG}"
    @mood -= rand(1..4)
    some_time_passed
  end

  def poop
    puts "You clean my poops, thnx. #{STATICMSG}"
    @level_of_poop += rand(1..2)
    some_time_passed
  end

  def scratch
    puts "Scratch-scratch... #{STATICMSG}"
    @heal += rand(1..3)
    some_time_passed
  end

  def claws
    puts "I dont like this. #{STATICMSG}"
    @anger += rand(1..2)
    some_time_passed
  end

  def kicked
    puts "For what? #{STATICMSG}"
    @health -= rand(1..2)
    some_time_passed
  end

  def change_stat
    die
    mood_s
    hunger_s
    sleep_s
    los
    anger_s
  end

  def anger_s
    return if @anger < 9
    puts 'i gone...'
    exit
  end

  def die
    return if @health > 0
    puts 'you kill me'
    exit
  end

  def mood_s
    return if @mood > 0
    puts 'pleeeease play with me'
  end

  def hunger_s
    return if @hunger > 0
    puts 'pleeeease feed me'
  end

  def sleep_s
    return if @sleep > 0
    puts 'pleeeease i need sleeping'
  end

  def los
    return if @level_of_poop > 0
    puts 'pleeeease clean my poop'
  end

  def stat
    puts 'Stats you pet:'
    puts "Health is #@health if 0, pets die"
    puts "Mood is #@mood, if 0 play with him"
    puts "Hunger is #@hunger if < 9, you pet need eat. Feed him"
    puts "Sleep is #@sleep, if 0 need to sleep"
    puts "Poop is #@level_of_poop, if 0 you need clean his poop"
    puts "Anger is #@anger, if < 9, you pet gone"
  end

  private
  def some_time_passed
    @hunger -= 1
    @level_of_poop -= 1
    change_stat
  end
end

puts 'What will be your pet\'s name?'
name = gets.chomp
pet = Tamagochi.new(name)
puts "You create #{name}."
pet.help

loop do
  command = gets.chomp
  if Tamagochi::COMMANDS.include?(command)
    pet.send(command.to_sym)
  elsif command == 'exit'
    puts 'Goodbay'
    exit
  else
    puts 'No command found. Try again or type help.'
  end
end