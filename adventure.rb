require_relative './locales'
require_relative './validator'
require_relative './messages'

class Adventure

	attr_accessor :life, :life_rnd, :dexterity

	def initialize 
    system "clear"
    @locales   = Locales.new
    @validator = Validator.new
    @messages  = Messages.new
	@messages.intro_prompt
	@dexterity = 0 
	get_life
	@messages.prompt_for_attribute
	get_attrib
    @locales.locale_00(@life_rnd, @dexterity)
	end

	def get_life
		# @life_rnd = gets.chomp
		@life_rnd = 70  # Stubbing in 70 as the input
		@validator.attribute_validator(@life_rnd)
		@life_rnd = make_rnd(@life_rnd)
		puts "You have #{@life_rnd} points of life."
	end

	def get_attrib
		@dexterity = gets.chomp
		@validator.attribute_validator(dexterity)
	    @dexterity = make_rnd(dexterity)
	    puts "Your dexterity is #{dexterity}"
	end

	def make_rnd(attribute)
		attribute = rand(0..attribute.to_i)
		puts "You rolled a #{attribute}"
		attribute
	end

	def status    # Show the 2 attributes
		puts "Your dexterity is #{dexterity} and life is #{life_rnd}"
	end


end

a = Adventure.new 
a
