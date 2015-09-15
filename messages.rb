
class Messages

  def invalid_direction
    puts "You've picked an invalid direction"
  end

  def impasse
    puts "You've hit an impasse and return."
  end

  def map_message
    puts "[99]***********"
    puts "***************"
    puts "***************"
    puts "***************"
    puts "***************"
    puts "*****[04]STAIRS"
    puts "*****[03]-MAP**"
    puts "**GOB[02]LIN***"
    puts "----CASTLE-----"
    puts "*****[01]******"
    puts "*****[00]******"
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
    when "I"
      "You have chosen to look in your inventory."
    when "Y"
      "Saying yes is usually a good idea."
    else
      "Somehow you put in a bad direction."
    end
  end

  def fight_convert(action)
    case action
    when "F"
      desc = "You decide to fight!"
    when "R"
      desc = "You run!!"
    end
  end

  def horse_direction(direction)
    case direction 
    when "N" 
      cardinal = "Northward"
    when "S"
      cardinal = "Southward"
    when "E"
      cardinal = "Eastward"
    when "W"
      cardinal = "Westward"
    end
    puts "You kick your horse sternly and move #{cardinal}!"
  end

  def prompt_for_attribute
    puts "Congrats, you now need to pick another attribute. \n" 	
  end  

  def intro_prompt
    puts "Choose your own adventure!"
    puts "Begin with determining your hero's attributes."
  end

end
