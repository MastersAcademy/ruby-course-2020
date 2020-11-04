class Tamagotchi
	attr_reader :health, :thirst, :satiety

	def initialize(health = 6, thirst = 6, satiety = 6)
		@health = health
		@thirst = thirst
		@satiety = satiety
		enter_the_name
	end

	def enter_the_name
		puts "Welcome to 'Tamagotchi' game!" 
		puts 'To get started, think of a name for your pet:'
		@name = gets.chomp.to_s
		puts
		puts "My congratulation! Now you have a pet '#{@name}'!"
		puts 'You are fully responsible for his life.'
		puts 'Don\'t forget to feed, water and walk with him on time.'
		puts 'Be responsible, because your carelessness can lead to his death.'
		puts
	end

	private
	
	def give_a_water
    @thirst += 2
    @health += 0.5
    @satiety -= 0.5
		puts "'#{@name}' drank water and wagged his tail."
	end

	def dont_give_a_water
    @thirst -= 2
    @health -= 0.5
		puts "'#{@name}' was left without water."
	end

	def walk_with_hat
    @health += 2
    @thirst -= 0.5
    @satiety -= 0.5
		puts "'#{@name}' walked and breathed fresh air."
	end

	def walk_without_hat
    @health -= 2
    @thirst -= 0.5
    @satiety -= 0.5
		puts "'#{@name}' walked and froze very hard without a hat."
	end

	def feed_satiety
    @satiety += 2
    @health += 0.5
    @thirst -= 0.5
		puts "'#{@name}' have eaten a special feed from pet shop 'Pet Shop Boys'. " 
	end

	def leftovers_satiety
    @satiety -= 2
    @health -= 0.5
    @thirst -= 0.5
		puts "'#{@name}' sniffed the leftovers and did not eat it."
  end
  
  def check_state?
    vomit?
    super_activity?
    urinated?
  end

	def vomit?
		if @satiety >= 10
			@satiety = 2
      @health -= 0.5
      @thirst -= 0.5
  		puts "You overfed the '#{@name}'... Oh, what is this?! '(#{@name}' vomits...)"
		end
  end
  
  def super_activity?
    if @health >= 10
      @satiety -= 0.5
      @thirst -= 0.5
      @health = 5
      puts "The '#{@name}' walked on the street more than necessary. His activity is outrageous! He jumps on your favorite coat and heavily soils it with his paws!"
		end
	end

  def urinated?
    if @thirst >= 10
      @thirst = 2
      @health -= 0.5
      puts "The '#{@name}' had drunk water and got wet... You mast to clean it."
    end
  end
  
end

class Pet < Tamagotchi

	def pet_info
		puts "'#{@name}'s' current state: Health = #{health}, Water Level = #{@thirst}, Satiety = #{satiety}"
		puts
	end

	def additional_action
		 gets.chomp.to_s.downcase
	end

	def additional_choise
		case @action
			when 'walk'
				puts "It is quite cold outside. Wear a hat to the '#{@name}'? (yes/no)"
				case additional_action
					when 'yes'
            walk_with_hat
          when 'no'
						walk_without_hat
					else 
						puts "You must type only 'yes' or 'no'."
						additional_choise
				end
			when 'feed'
				puts "It's time to feed the '#{@name}'. You have a special feed for your pet and leftovers from yesterday evening."
			  puts	"What will you give the '#{@name}'? (feed/leftovers)"
				case additional_action
					when 'feed'
						feed_satiety
					when 'leftovers'
						leftovers_satiety
					else
					puts "You must type only 'feed' or 'leftovers'."
					additional_choise
				end
			when 'drink'
				puts "You are in a hurry, but you need to give water to the '#{@name}'."
				puts "Will you give water to the '#{@name}' now or later? (now/later)"
				case additional_action
					when 'now'
						give_a_water
					when 'later'
						dont_give_a_water
					else
			 			puts "You must type only 'now' or 'later'."
						additional_choise
					end
			else
				puts 'Wrong action! Try type again:'
				@action = gets.chomp.to_s.downcase
				additional_choise	
			end
	end
	
	def check_empty_name?
		if @name.length <= 0 
			puts 'Name of the pet can\'t be empty!'
			puts 'Try type again:'
			@name = gets.chomp.to_s
			check_empty_name?
		end
	end

	def make_a_choise
		puts 'Okay, it\'s time to take care of your baby. Enter to \'walk\', \'feed\' or \'drink\' of your choice:'
		@action = gets.chomp.to_s.downcase
		additional_choise
	end

  def start_game
    pet_info
		check_empty_name?
		make_a_choise
	end	

	def end_game?
    if @health <= 0
      pet_info
      puts "Your '#{@name}' got sick and died. So, live with that..."
			exit
    elsif @thirst <= 0
      pet_info
      puts "Your '#{@name}' died of thirst. You can make a mummy from him..."
			exit
    elsif @satiety <= 0
      pet_info
      puts "You didn't feed your '#{@name}' and he died of hunger. Seems like you shouldn't have pets... "
			exit
		end
	end

	def game_loop
		loop do
			start_game
  	  check_state?
			end_game?
		end
	end

end

ruby = Pet.new
ruby.game_loop