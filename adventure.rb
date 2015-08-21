puts "Choose your own adventure!"
puts "Begin with determining your hero's attributes"
get_life
def get_life
	life = gets.chomp.to_i	
end


puts "You have #{rand(life)} points of life."


