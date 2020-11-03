class Tamagochi
  #PET_SELECTION = ['cat', 'dog', 'dragon']

  def initialize ( pet,name, color )
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
      puts "Your pets play"
    else
      puts "Your pets no played"
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
    puts "Pet eating"
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
      puts "Myav - myav"
    when  'dog'
      puts "Gav - gav"
    when 'dragon'
      puts "AaaaRrrrrrrrrr"
    end

  end

  def helth_pet
    @helth = (satiety + stamina + joy) / 3
    puts "Health  = #{helth}"
  end

  def pet_info
    pet_info=<<-TEXT
    Info your pets
    Name - #{name}, pet - #{@pet}, color - #{@color}
    Satieti = #{satiety}
    Stamina = #{stamina}
    Joy = #{joy}
    helth_pet
  TEXT
    puts pet_info
    end

  private
  attr_accessor :satiety, :stamina, :helth, :joy
  attr_reader :name

end

sensey = Tamagochi.new("cat", "Sensey", "gray")
sensey.play
sensey.say
sensey.pet_info


