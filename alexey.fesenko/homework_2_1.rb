class Tamagochi

  MALE_NAMES = %w[Boy Bill George Harry].freeze
  FEMALE_NAMES = %w[Girl Bonnie Ginger Georgetta].freeze

  def initialize(food, joy, energy, name, gender)
    @food = food
    @joy = joy
    @name = name
    @gender = gender
    @energy = energy
  end
  def rand_pet # рандомно назначить атрибуты питомца
    @joy = rand (0..5)
    @food = rand (0..5)
    @energy = rand (0..5)
    gender = rand (0..5)
    if gender >= 3
      @gender = 'male'
    else
      @gender = 'female'
    end
    if @gender == 'male'
      @name = MALE_NAMES.sample
    else
      @name = FEMALE_NAMES.sample
    end
  end

  def play # играть - восстанавливает радость
    if @joy < 5
      @joy += 1
    elsif @joy >= 5
      p "#{@name} already happy!"
      else
      @joy = @joy - 1
    end
  end

  def feed # покормить - восстанавливает еду
    if @food < 5
      @food += 1
    elsif @food >= 5
      p "#{@name} already ate enough!"
    else
      @food = @food - 1
    end
  end

end

class Pet < Tamagochi

  def working # заставить питомца работать
    if @energy > 0
      @energy = @energy - 1
    else
      p "#{@name} needs a rest!"
    end

    if @food > 0
      @food = @food - 1
    else
      p "#{@name} needs to eat!"
    end

    if @joy > 0
      @joy = @joy - 1
    else
      p "#{@name} needs to play!"
    end
  end

  def recreation # восстановление энергии
    if @energy >= 5
      p "#{@name} rest enough"
    else
      @energy = @energy + 1
    end
  end

  def info # информация о питомце
    p "Name: #{@name}, Gender: #{@gender}, Satiety: #{@food}, Joy: #{@joy}, Energy: #{@energy}"
  end

end

#cat = Pet.new(5,5,5,'George', 'male')
