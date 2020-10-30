class Tamagochi
  #PET_SELECTION = ['cat', 'dog', 'dragon']

  def initialize ( pet,name, color)
    @name = name
    @color = color
    @pet = pet
    @satiety = 100
    @stamina = 100
    @joy = 80
    @helth = 100
  end

  def play
    if stamina >= 20 && satiety >= 20
       @satiety = satiety - 30
       @stamina = stamina - 30
       if joy >= 100
          @joy = 100
       else
         @joy = joy + 20
       end
      p "Your pets play"
    else
      p "Your pets no played"
    end
  end

  def eat
    @satiety = 100
    if stamina >= 100
      @stamina = 100
    end
     if joy >= 100
       @joy = 100
     else
      @joy = joy + 5
     end
    p "Pet eating"
  end

  def sleep
    @satiety = satiety - 10
    @stamina = 100
    if joy >= 100
      @joy = 100 -5
    else
      @joy = joy -5
    end
  end

  def say
    case @pet
    when 'cat'
      p "Myav - myav"
    when  'dog'
      p "Gav - gav"
    when 'dragon'
      p "AaaaRrrrrrrrrr"
    end

  end

  def helth_pet
    @helth = (satiety + stamina + joy) / 3
    puts "Health  = #{helth}"
  end

  def pet_info
    puts "Info your pets".center(50)
    puts "Name - #{name}, pet - #{@pet}, color - #{@color}"
    puts "Satieti = #{satiety}"
    puts "Stamina = #{stamina}"
    puts "Joy = #{joy}"
    helth_pet
  end

  private
  attr_accessor :satiety
  attr_reader :name
  attr_accessor :stamina
  attr_accessor :helth
  attr_accessor :joy

end

sensey = Tamagochi.new("cat", "Sensey", "gray")
sensey.play
sensey.say
sensey.pet_info





