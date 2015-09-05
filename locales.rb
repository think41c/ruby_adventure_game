class Locales

  def initialize
    @validator = Validator.new
  end

  def choose
    
  end

  def locale_00  # needs to be refactored to take in the direction with the locale method
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction  = gets.chomp
    if @validator.valid_or_not(direction) == false then locale_00 end
    

    if direction.upcase == "N"
      puts "You kick your horse sternly to move Northward!"
      location = "locale_01"
      locale_01
    else
      puts "You hit an impasse and return."
      locale_00
    end
  end

  def locale_01
    puts "You're standing in front of the castle. The path you came from is to the (S)outh. The gate is (N)orth."
    direction  = gets.chomp.upcase
    if @validator.valid_or_not(direction) == false then locale_01 end

    case direction 
    when "N" 
      locale_02
    when "S"
      puts "You kick your horse sternly to move Southward!"
      locale_00
    end
  end

  def locale_02
    puts "You've busted into the castle!"
  end

end
