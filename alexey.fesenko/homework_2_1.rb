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

  def rand_pet # randomize pets attributes
    @joy = rand (0..5)
    @food = rand (0..5)
    @energy = rand (0..5)
    @gender = %w[male female].sample
    if @gender == 'male'
      @name = MALE_NAMES.sample
    else
      @name = FEMALE_NAMES.sample
    end
  end

  def play # recover joy
    if @joy < 5
      @joy += 1
    elsif @joy >= 5
      p "#{@name} already happy!"
      else
      @joy = @joy - 1
    end
  end

  def feed # recover food
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

  def working # make pet to work
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

  def recreation # energy recovery
    if @energy >= 5
      p "#{@name} rest enough"
    else
      @energy = @energy + 1
    end
  end

  def info # pet information
    p "Name: #{@name}, Gender: #{@gender}, Satiety: #{@food}, Joy: #{@joy}, Energy: #{@energy}" 
  end
end

#cat = Pet.new(5,5,5,'George', 'male')
