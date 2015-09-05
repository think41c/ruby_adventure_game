require_relative './b'

class A 
	def initialize
		@work = 33
		b = B.new
	end
end

class B < A
	def initialize
		p @work
	end
end

a = A.new
a
