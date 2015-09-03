require_relative './locales'
require_relative './validator'

class Intro

	attr_accessor :life, :life_rnd, :dexterity

	def initialize 
    @locales = Locales.new
    @validator = Validator.new
		intro_prompt
		@dexterity = 0 
		get_life
		prompt_for_attribute
		get_attrib
    locale_00
	end


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

	def intro_prompt
		puts "Choose your own adventure!"
		puts "Begin with determining your hero's attributes."
	end

	def get_life
		# @life_rnd = gets.chomp
		@life_rnd = 70  # Stubbing in 70 as the input
		attribute_validator(@life_rnd)
		@life_rnd = make_rnd(@life_rnd)
		puts "You have #{@life_rnd} points of life."
	end


	def get_attrib
		dexterity = gets.chomp
		attribute_validator(dexterity)
    dexterity = make_rnd(dexterity)
    puts "Your dexterity is #{dexterity}"
	end

	def make_rnd(attribute)
		attribute = rand(0..attribute.to_i)
		puts "You rolled a #{attribute}"
		attribute
	end

	def prompt_for_attribute
		puts "Congrats, you now need to pick another attribute. \n\n\n" 	
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

  def invalid_direction
    puts "You've picked an invalid direction"
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

a = Intro.new 
a
