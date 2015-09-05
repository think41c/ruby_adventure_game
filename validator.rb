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

  def valid_or_not(direction)  
    if direction_validator(direction) == true
      puts cardinal_convert(direction)
    else
      "Choose again"
      locale_00
    end
  end

  def direction_validator(direction)
    if direction.to_s.match(/[NSEW]/i) && direction.length == 1
      puts "You've picked a noble direction!"
      true
    else
      puts "Not a valid direction!"
      false
    end
  end
end
