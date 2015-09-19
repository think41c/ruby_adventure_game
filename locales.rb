class Locales

  def initialize
    @looked_at_map     = false
    @visited_before_03 = false
    @validator   = Validator.new
    @messages    = Messages.new
    @inventory   = {}
    @goblin_dead = false
  end

  def locale_00(life, dex) 
    @life = life
    @dex  = dex
    locale_001
  end 

  def locale_001
    puts "You're outside a castle. You see a path to the north. N/S/E/W"    
    direction  = gets.chomp.upcase
    locale_001 if @validator.valid_or_not(direction) == false
    
    case direction
    when "N"
      @messages.horse_direction(direction)
      locale_01
    else
      @messages.impasse
      locale_001
    end
  end

  def locale_01
    puts "You're standing in front of the castle. The path you came from is to the (S)outh. The gate is (N)orth."
    direction  = gets.chomp.upcase
    locale_001 if @validator.valid_or_not(direction) == false

    case direction 
    when "N" 
      @messages.horse_direction(direction)
      locale_02
    when "S"
      @messages.horse_direction(direction)
      locale_001
    else
      @messages.horse_direction(direction)
      @messages.impasse
      locale_001
    end
  end

  def examine_map(examine_response)
    case examine_response.upcase
    when "Y" 
      puts "You look at the map."
      @messages.map_message
    when "N"
      puts "You move on from looking at the map."
    else 
      puts "You didn't make a valid choice. (Y)es or (N)o?"
      examine_response = gets.chomp
      examine_map(examine_response)
    end
    @looked_at_map = true
  end

  def inventory_menu
    @inventory.each do |key, value|
      if key == :map && value == true && @looked_at_map == false
        puts "You have a trusty (and crusty) map. Examine it? (Y)es or (N)o."
        examine_response = gets.chomp
        examine_map(examine_response)
      end
    end
    puts "That's everything in your inventory."
  end

  def locale_02
    puts "You've busted into the castle!"
    if @goblin_dead == false
      puts " You encounter a goblin. Should you (F)ight or (R)un?"
    end
    action = gets.chomp.upcase
    locale_02 if @validator.fight_valid_or_not(action) == false

    case action
    when "F" 
      puts "You win the fight!"
      @goblin_dead = true
      locale_03
    when "R"
      puts "You run like a wimp!"
      locale_99
    end
  end

  def locale_04
    puts "You see a staircase to the (N)orth. You came from the South. N/S/E/W. (I)nventory."
    direction  = gets.chomp.upcase
    locale_04 if @validator.valid_or_not(direction) == false
    case direction 
    when "I" 
      inventory_menu
      locale_04
    when "N"
      if @dex < 50 
        puts "Your dexterity is too low."
        locale_04
      else
        puts "yoru dexterity is enough. But you decide to rethink things."
        locale_04
      end
    when "S" 
      puts "You travel back the way you came, where you once saw a goblin."
    when "E"
      puts "You hit an impasse."
      locale_04
    when "W"
      puts "You hit an impasse."
      locale_04
    else
      puts "You entered something wrong."
      locale_04
    end  
  end

  def locale_03
    if @visited_before_03 == false
      @visited_before_03 = true
      puts "You are triumphant! You may want to check your stamina after that fight."
      puts "Your life is #{@life}, and your dex is #{@dex}".rjust(60, "*-")
      puts "You see a map on the floor. Pick it up? (Y)es or (N)o." 
      direction  = gets.chomp.upcase
      locale_03 if @validator.valid_or_not(direction) == false
      case direction
      when "Y"
        puts "You add the map to your inventory."
        @inventory = {map: true}
        locale_04
      when "N"
        puts "You foolishly leave the map on the ground and walk forward."
        @inventory = {map: false}
        locale_04
      end
    end
    puts "You move onto locale_04"
    locale_04
  end

  def locale_99
    puts "While running you trip. You've fallen into a trap door. You can't see anything. N/S/E/W?"
    direction  = gets.chomp.upcase
    locale_99 if @validator.valid_or_not(direction) == false

    case direction
    when "N"
      @messages.impasse
      locale_99
    when "S"
      puts "You stumble around for a while and then walk through some spider webs."
      @messages.impasse
      locale_99
    when "E"
      puts "Somehow or other, you find yourself in front of anoher goblin."
      locale_02
    when "W"
      puts "You begin to walk, but think it might be haunted and return."
      locale_99
    end
  end
end
