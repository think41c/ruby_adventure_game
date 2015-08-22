class Intro
	puts "Choose your own adventure!"
	puts "Begin with determining your hero's attributes"


	def get_life
		@life = gets.chomp
		validate_life
	end

	def validate_life
		if @life.class != Fixnum
			puts "it's not a number!"
		end
		
		if @life > 100
			puts "Try again"
			get_life
		end
	end


end

a = Intro.new 
a.get_life
a.validate_life
puts "You have #{rand(@life)} points of life."