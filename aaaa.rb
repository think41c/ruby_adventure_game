    class Stack
    	attr_reader :pi, :euler  # ... and dozens more of these
    
    	def initialize
    		@pi = 3.14 + 8
            @euler = 0.577 + 8
            # dozens more assignements here
    	end
    end
    
    class Overflow
    	def show
            a = Stack.new
    		p a.pi  # attr_reader works fine here
    	end
    end

    class AnotherClass
        def whatever
            # Do I really need to create another instance of the Stack class?
            # or should AnotherClass somehow inherit all the instance variables?
        end
    end

    
    Overflow.new.show   # => 11.14. 