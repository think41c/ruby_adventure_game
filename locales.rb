class Locales

  def locale_00  # needs to be refactored to take in the direction with the locale method
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction = gets.chomp
    @validator = Validator.new
    @validator.valid_or_not(direction)
    puts "after validator"

    if direction.upcase == "N"
      puts "You kick your horse sternly to move Northward!"
      location = "locale_01"
      locale_01
    else 
      puts "You hit an impasse and return to the castle."
      locale_01
      # Instead of going back to locale_01, can I go
      # back to the method that just called it? 
    end
  end

  def locale_01
    puts "You're standing in front of the castle. The path you came from is to the (S)outh. The gate is (N)orth."
    direction = gets.chomp
    
    if direction_validator(direction) == false 
      invalid_direction
      locale_01
    end

    puts cardinal_convert(direction)

    case direction 
    when "N" 
      locale_02
    when "S"
      locale_00
    end
  end

  def locale_02
    puts "You've busted into the castle!"
  end

end
