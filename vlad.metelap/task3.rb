class Pet
  attr_accessor :health, :temperature, :is_alive, :min_health, :min_temperature, :max_temperature

  def initialize(health, temperature)
    @health = health
    @temperature = temperature
    @is_alive    = true
  end

  def give_medication
    @health += 1
    @temperature = 36.6
  end
  def walk
    @health += 1
    @temperature -= 1
  end

end

first_pet = Pet.new(100, 36)
puts "Initialize: \nhealth: #{first_pet.health}  temperature: #{first_pet.temperature} alive: #{first_pet.is_alive}"
# puts first_pet.is_alive
num_secs = 5
iteration = 0
while first_pet.is_alive do
  puts "Iteration #{iteration}"3
  sleep(num_secs)
  first_pet.health    -= rand(0..num_secs)


  first_pet.temperature -= rand(0..num_secs)
  first_pet.health      = if ((first_pet.temperature >= 35) && (first_pet.temperature <= 38))
                            first_pet.health+1
                          else
                            first_pet.health-1
                          end
  first_pet.is_alive    = false if first_pet.temperature > 80 || first_pet.temperature <10 || first_pet.health < 0
  puts "health: #{first_pet.health} temperature: #{first_pet.temperature} alive: #{first_pet.is_alive}"

  print"1. To give medication the Pet"
  print"2. Go to walk with Pet"
  print"3. Skip"
  print"Enter a command: "
  inp = gets.chomp
  case inp
  when 1
    first_pet.give_medication
  when 2
    first_pet.walk
  else
  end
  iteration += 1
  break if iteration > 20
end
puts "*************** Pet is dead! *****************"
puts "Pet is dead! health: #{first_pet.health}  temperature: #{first_pet.temperature} alive: #{first_pet.is_alive}"