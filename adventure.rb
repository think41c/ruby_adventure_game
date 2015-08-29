class Intro

	attr_accessor :life, :life_rnd, :dexterity

	def initialize 
		intro_prompt
		@dexterity = 0 
		get_life
		prompt_for_attribute
		get_attrib
	end

	def intro_prompt
		puts "Choose your own adventure!"
		puts "Begin with determining your hero's attributes."
	end

	def get_life
		# @life_rnd = gets.chomp
		@life_rnd = 70  # Stubbing in 7 as the input
		attribute_validator(@life_rnd)
		@life_rnd = make_rnd(@life_rnd)
		puts "You have #{@life_rnd} points of life."
	end

	def validate_dexterity
		if @dexterity.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_attrib
		end
	end
    
	def attribute_validator(user_input)
		if user_input.to_s.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_life
		end

		if user_input.to_i > 100 || user_input.to_i < 0
			puts "Try again with a number between 0 and 100."
			get_life
		end
	end

	def get_attrib
		dexterity = gets.chomp
		attribute_validator(dexterity)
    dexterity = make_rnd(dexterity)
    puts "Your dexterity is #{dexterity}"
	end

	def make_rnd(attribute)
		attribute = rand(0..attribute.to_i)
		puts "You rolled a #{attribute}"
		attribute
	end

	def prompt_for_attribute
		puts "Congrats, you now need to pick another attribute." 	
	end

  def begin
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction = gets.chomp
    direction_validator(direction)
    puts "You decide to travel #{direction}?"

  end

  def direction_validator(direction)
    if direction.to_s.match(/[NSEW]/i) && direction.length == 1
      puts "It's valid"
    else
      puts "Not a valid direction!"
    end
  end


end


a = Intro.new 
a
a.begin
