class Locales
	
  def locale_00
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction = gets.chomp
    if direction_validator(direction) == true
      puts cardinal_convert(direction)
    else
      "Choose again"
      locale_00
    end

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
end
