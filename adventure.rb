class Intro
	def initialize 
		puts "Choose your own adventure!"
		puts "Begin with determining your hero's attributes."
		@life_rnd  = 0 
		@dexterity = 0 
	end

	def get_life
		@life = gets.chomp
		validate_life
	end

	def validate_dexterity
		if @dexterity.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_attrib
		end
	end

	def validate_life
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
		validate_life
	end

	def make_rnd
		@life_rnd = rand(0..@life.to_i)
		puts @life_rnd
	end

	def prompt_for_attribute
		puts "Congrats, you now need to pick another attribute." 	
	end
end

a = Intro.new 
a.get_life
a.validate_life
puts "You have #{rand(1..@life.to_i)} points of life."
a.make_rnd
a.prompt_for_attribute
a.get_attrib
