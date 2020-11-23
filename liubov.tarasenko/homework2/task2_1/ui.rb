# frozen_string_literal: true

require_relative 'pet'
require_relative 'console_beauty'

class Ui
  COMMANDS = %w[feed play water walk let_sleep status].freeze
  def start
    init_dog

    loop do
      if @dog.is_dead?
        puts 'i`m dying. i loved u. sorry. '.red
        break
      end

      command = enter_command
      case command
      when 'feed'
        @dog.feed
      when 'water'
        @dog.water
      when 'walk'
        @dog.walk
      when 'let_sleep'
        @dog.sleepy
      when 'play'
        @dog.play
      when 'status'
        p @dog
      else
        p "sorry, i don't know this command: #{command}"
      end
    end
  end

  def init_dog
    puts 'name? '.yellow
    name = gets.strip
    puts 'breed? '.yellow
    breed = gets.strip
    @dog = Dog.new(name, breed)
    puts "woof. i'm u`r dog ".blue
    p @dog
  end

  def enter_command
    puts 'choose a command, please: '.green
    puts COMMANDS
    command = gets.strip.downcase
  end
end

Ui.new.start
