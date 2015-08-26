class Intro

	attr_accessor :life, :life_rnd, :dexterity

	def initialize 
		intro_prompt
		@life_rnd  = 0 
		@dexterity = 0 
		get_life
		attribute_validator
		prompt_for_attribute
		puts "You have #{@life_rnd} points of life."
		get_attrib

	end

	def intro_prompt
		puts "Choose your own adventure!"
		puts "Begin with determining your hero's attributes."
	end

	def get_life
		# @life_rnd = gets.chomp
		@life_rnd = 7   # Stubbing in 7 as the input
		attribute_validator
		@life_rnd = make_rnd(@life_rnd)
	end

	def validate_dexterity
		if @dexterity.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_attrib
		end
	end

	def attribute_validator
		puts "#{@life_rnd} --- "
		if @life_rnd.to_s.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_life
		end

		if @life_rnd.to_i > 100 || @life_rnd.to_i < 0
			puts "Try again with a number between 0 and 100."
			get_life
		end
	end

	def get_attrib
		@attrib = gets.chomp
		attribute_validator
	end

	def make_rnd(attribute)
		attribute = rand(0..attribute.to_i)
		puts "You rolled a #{attribute}"
	end

	def prompt_for_attribute
		puts "Congrats, you now need to pick another attribute." 	
	end
end

a = Intro.new 
a

