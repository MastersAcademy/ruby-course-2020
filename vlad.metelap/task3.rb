class Pet
  attr_accessor :health, :temperature, :mood, :is_alive, :min_health, :min_temperature, :max_temperature

  def initialize(health, temperature, mood)
    @health = health
    @temperature = temperature
    @is_alive    = true
    @mood        = mood
  end

  def give_medication
    @health += 1
    @temperature = 36.6
    @mood -= 10
  end
  def walk
    @health += 10
    @temperature -= 1
    @mood += 5
  end
  def feed
    @health += 1
    @mood += 10
    @temperature += 1
  end

end

first_pet = Pet.new(60, 36, 30)
puts "Initialize: \nhealth: #{first_pet.health}  temperature: #{first_pet.temperature} mood: #{first_pet.mood}  alive: #{first_pet.is_alive}"
# puts first_pet.is_alive
num_secs = 5
iteration = 0
while first_pet.is_alive do
  puts "Iteration #{iteration}"
  sleep(num_secs)
  first_pet.health    -= rand(0..num_secs)


  first_pet.temperature -= rand(0..num_secs)
  first_pet.health      = if ((first_pet.temperature >= 35) && (first_pet.temperature <= 38))
                            first_pet.health+1
                          else
                            first_pet.health-1
                          end
  first_pet.is_alive    = false if first_pet.temperature > 80 || first_pet.temperature <30 || first_pet.health < 50 || first_pet.mood < 20
  puts "health: #{first_pet.health} temperature: #{first_pet.temperature} alive: #{first_pet.is_alive}"
  break if !first_pet.is_alive

  puts "1. To give medication the Pet"
  puts"2. Go to walk with Pet"
  puts"3. Feed a Pet"
  puts"4. Skip"

  print"Enter a command: "
  inp = gets.chomp
  case inp
  when 1
    first_pet.give_medication
  when 2
    first_pet.walk
  when 3
    first_pet.feed
  when 4
    print"You enter Skip"
  else

  end
  iteration += 1
  break if iteration > 20
end

if !first_pet.is_alive
  puts ""
  puts "*************** Pet is dead! *****************"
  puts "Pet is dead! health: #{first_pet.health}  temperature: #{first_pet.temperature} alive: #{first_pet.is_alive}"
end
