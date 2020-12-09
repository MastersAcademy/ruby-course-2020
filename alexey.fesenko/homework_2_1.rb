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

  def rand_pet
    @joy = rand(0..5)
    @food = rand(0..5)
    @energy = rand(0..5)
    @gender = %w[male female].sample
    @name = @gender == 'male' ? MALE_NAMES.sample : FEMALE_NAMES.sample
  end

  def play
    if @joy < 5
      @joy += 1
    elsif @joy >= 5
      p "#{@name} already happy!"
    else
      @joy -= 1
    end
  end

  def feed
    if @food < 5
      @food += 1
    elsif @food >= 5
      p "#{@name} already ate enough!"
    else
      @food -= 1
    end
  end
end

class Pet < Tamagochi
  def working
    if @energy.positive?
      @energy -= 1
    else
      p "#{@name} needs a rest!"
    end

    if @food.positive? 0
      @food -= 1
    else
      p "#{@name} needs to eat!"
    end

    if @joy.positive?
      @joy -= 1
    else
      p "#{@name} needs to play!"
    end
  end

  def recreation
    if @energy >= 5
      p "#{@name} rest enough"
    else
      @energy += 1
    end
  end

  def info
    p "Name: #{@name}, Gender: #{@gender}, Satiety: #{@food}, Joy: #{@joy}, Energy: #{@energy}"
  end
end
