class Pet
  MAX_VALUE = 100
  PETS = ['cat', 'dog', 'parrot']

  def initialize(name, kind)
    @name = name
    @kind = kind
    @health = MAX_VALUE
    @eat = MAX_VALUE
    @stamina = MAX_VALUE
    check_pet!
  end

  def get_pet
    "#{@kind}, #{@name}"
  end

  def info_pet
    puts "Health #{@health}"
    puts "Eat #{@eat}"
    puts "Stamina #{@stamina}"
  end

  def walk
    @eat = attribute_control(@eat - 15)
    @stamina = attribute_control(@stamina - 20)
  end

  def eat
    @eat = MAX_VALUE
    @stamina = attribute_control(@stamina - 5)
    @health = attribute_control(@health + 50)
  end

  def give_pussy
    @health = attribute_control(@health - 30)
    @eat = attribute_control (@eat - 20)
    @stamina = attribute_control(@stamina - 10)
  end

  def sleep
    @health = MAX_VALUE
    @stamina = MAX_VALUE
    @eat = attribute_control(@eat - 30)
  end

  def say
    case @kind
    when 'parrot'
      'chik chirik'
    when 'dog'
      'gav gav'
    when 'cat'
      'mur myav'
    end
  end

  def alive?
    @health.zero?
  end

  private

  def attribute_control(attribute)
    if attribute > MAX_VALUE
      return MAX_VALUE
    end
    if attribute < 0
      return 0
    end
    attribute
  end

  def check_pet!
    raise(ArgumentError.new('Who are you?')) unless PETS.include?(@kind)
  end
end


pet = Pet.new('Kesha', 'parrot')
puts "#{pet.say}. ya #{pet.get_pet}"
pet.eat
pet.give_pussy
pet.walk
pet.eat
pet.sleep
pet.info_pet
