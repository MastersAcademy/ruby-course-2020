class Pet
  attr_accessor :health, :fun, :energy

  def initialize
    @health = 10
    @fun = 10
    @energy = 10
  end

  def run
    p 'Pet running'
    @energy -= 2
    @fun += 2
    @health += 2
    info
  end

  def info
    p @health
    p @fun
    p @energy
  end

  def eat
    p 'Pet eats'
    @energy += 5
    @fun += 3
    @health += 5
    info
  end

  def sleep
    p 'Pet sleep'
    @energy += 3
    @fun += 1
    @health += 2
    info
  end

  def fight
    p 'Pet fights with a bear'
    @energy -=10
    @fun -=10
    @health -=10
    info
  end

  def check
    p 'Please buy new pet' if @health <= 0 || @fun <= 0 || @energy <= 0
  end
end

pet = Pet.new

def help
  p '1 - Run'
  p '2 - Eat'
  p '3 - Sleep'
  p '4 - Fight'
  p '0 - Help'
end

loop do
  help

  command = gets.chomp

  break if (command.downcase) == 'exit'

  case command

  when '1'
    pet.run
  when '2'
    pet.eat
  when '3'
    pet.sleep
  when '4'
    pet.fight
  when '0'
    help
  else
    p 'unknown command, check help'
  end

  pet.check
  p '--------------'
  p 'It\'s new day'
  p '--------------'
end
