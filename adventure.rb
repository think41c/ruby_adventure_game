class Intro
	puts "Choose your own adventure!"
	puts "Begin with determining your hero's attributes."

	def get_life
		@life = gets.chomp
		validate_life
	end

	def validate_life
		if @life.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_life
		end

		if @life.to_i >= 100 && @life.to_i >= 0
			puts "Try again with a number between 0 and 100."
			get_life
		end
	end


end

a = Intro.new 
a.get_life
a.validate_life
puts "You have #{rand(1..@life.to_i)} points of life."