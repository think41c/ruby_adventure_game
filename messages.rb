
class Messages

  def invalid_direction
    puts "You've picked an invalid direction"
  end

  def cardinal_convert(direction)
    case direction.upcase
    when "N" 
      "You have chosen North"
    when "S"
      "You have chosen South"
    when "E"
      "You have chosen East"
    when "W"
      "You have chosen West"
    else
      "Somehow you put in a bad direction."
    end
  end

  def prompt_for_attribute
    puts "Congrats, you now need to pick another attribute. \n" 	
  end  

  def intro_prompt
    puts "Choose your own adventure!"
    puts "Begin with determining your hero's attributes."
  end

end
