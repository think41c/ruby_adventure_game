class Locales

  def initialize
    @validator = Validator.new
    @messages  = Messages.new
  end

  def choose
    
  end

  def locale_00  # needs to be refactored to take in the direction with the locale method
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction  = gets.chomp.upcase
    if @validator.valid_or_not(direction) == false then locale_00 end
    
    case direction
    when "N"
      @messages.horse_direction(direction)
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
      @messages.horse_direction(direction)
      locale_02
    when "S"
      @messages.horse_direction(direction)
      locale_00
    else
      @messages.horse_direction(direction)
      @messages.impasse
      locale_01
    end
  end

  def locale_02
    puts "You've busted into the castle!"
  end

end
