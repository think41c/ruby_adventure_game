class Intro

	attr_reader :life

	def initialize 
		puts "Choose your own adventure!"
		puts "Begin with determining your hero's attributes."
		@life_rnd  = 0 
		@dexterity = 0 
	end

	def get_life
		@life = gets.chomp
		attribute_validator
	end

	def validate_dexterity
		if @dexterity.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_attrib
		end
	end

	def attribute_validator
		if @life.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_life
		end

		if @life.to_i > 100 || @life.to_i < 0
			puts "Try again with a number between 0 and 100."
			get_life
		end
	end

	def get_attrib
		@attrib = gets.chomp
		attribute_validator
	end

	def make_rnd(attribute)
		# @life_rnd = rand(0..@life.to_i)
		# puts @life_rnd
		attribute = rand(0..attribute.to_i)
		puts "You rolled a #{attribute}"
	end

	def prompt_for_attribute
		puts "Congrats, you now need to pick another attribute." 	
	end
end

a = Intro.new 
a.get_life
a.attribute_validator
puts "You have #{rand(1..@life.to_i)} points of life."
puts a.life
a.prompt_for_attribute
a.get_attrib
