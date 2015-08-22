class Intro
	puts "Choose your own adventure!"
	puts "Begin with determining your hero's attributes"


	def get_life
		@life = gets.chomp
		validate_life
	end

	def validate_life
		if @life.include?("A")
			puts "it's not a number!"
			get_life
		end

		if @life.to_i > 100
			puts "Try again"
		end
	end


end

a = Intro.new 
a.get_life
a.validate_life
puts "You have #{rand(@life)} points of life."