class Validator

	def validate_dexterity
		if @dexterity.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_attrib
		end
	end

	def attribute_validator(user_input)
		if user_input.to_s.match(/[A-Z]/i)
			puts "Please type in a number only."
			get_life
		end

		if user_input.to_i > 100 || user_input.to_i < 0
			puts "Try again with a number between 0 and 100."
			get_life
		end
	end

  def fight_valid_or_not(action)
    @messages = Messages.new
    if fight_validator(action) == true
      puts @messages.fight_convert(action)
    else
      "Choose again"
      false
    end
  end 

  def valid_or_not(direction) 
    @messages = Messages.new 
    if direction_validator(direction) == true
      puts @messages.cardinal_convert(direction)
    else
      "Choose again"
      false
    end
  end

  private 
  
  def fight_validator(action)
    if action.to_s.match(/[FR]/i) && action.length == 1
      puts "You make a hasty choice."
      true
    else
      puts "Not a valid action."
      false
    end
  end

  def direction_validator(direction)
    if direction.to_s.upcase.match(/[NSEWYI]/i) && direction.length == 1
      puts "You've picked a noble direction!"
      true
    else
      puts "Not a valid direction!"
      false
    end
  end
end
