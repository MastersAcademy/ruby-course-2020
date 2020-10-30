require_relative 'console_beauty'
class Dog

  def initialize(name, breed)
    @name = name
    @breed = breed
    @feed_level = 3
    @drink_level = 3
    @energy_level = 3
    @wanna_walk = false  
  end

  def feed
    if @feed_level < 3 
      @feed_level = 3
      puts "omnomnom. so tasty.".pink
      @wanna_walk = true
    else 
      puts 'not hungry'.light_blue
    end
    check
  end

  def water
    if @drink_level < 3 
      @drink_level = 3
      puts 'hlyp-hlyp-hlyp'.pink 
      @wanna_walk = true
    else
      puts 'not thirsty'.light_blue
    end
    check
  end

  def sleepy
    if @energy_level < 3 
      @energy_level = 3
      puts 'uuuuh hhhhhhhrrrrrrpppppchhhhh, hhhhhhrrrrrppppttttchhhhyyyyy'.pink 
    else 
      puts 'don`t wanna sleep'.light_blue
    end
    low_states
    check
  end

  def walk
    if @wanna_walk
      @wanna_walk = false
      puts 'whoof. whoof. i love u.'.pink
    else
      puts 'don`t wanna walk'.light_blue
    end
    low_states
    check
  end

  def play
    puts  'whoof. whooh. u`re so funny, love u, dude :*'.pink   
    low_states
    check
  end

  def is_dead?   
    @feed_level == 0 || @drink_level == 0 || @energy_level == 0
  end

  private

  def low_states
    @energy_level -= 1
    @feed_level -= 1
    @drink_level -= 1
  end

  def is_hungry?
    @feed_level == 1
  end

  def is_thirsty?
    @drink_level == 1
  end

  def has_not_energy?
    @energy_level == 1
  end

  def need_walk?
    @wanna_walk
  end

  def check
    puts 'I`m so  hungry!'.red if is_hungry?
    puts 'I`m so thirsty!'.red if is_thirsty?
    puts 'I need to walk!'.red if need_walk?
    puts 'I need to sleep!'.red if has_not_energy?
  end

end