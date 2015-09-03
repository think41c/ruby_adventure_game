require_relative './locales'
require_relative './validator'

class Intro

	attr_accessor :life, :life_rnd, :dexterity

	def initialize 
    @locales   = Locales.new
    @validator = Validator.new
    @messages  = Messages.new
		intro_prompt
		@dexterity = 0 
		get_life
		prompt_for_attribute
		get_attrib
    locale_00
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
end

a = Intro.new 
a
