#
# Author: Riccardo Orizio (R)
# Date: 30 June 2016
#
# Description: Line class used for Koch
#

require_relative "./Point.rb"

class Line

	# Array of all lines created
	@@array = Array.new
	attr_accessor :a, :b

	def self.all_instances
		@@array
	end

	# Constructor
	def initialize( a, b )
		@a = a
		@b = b
		# Adding the current element to the list of all lines
		@@array << self
	end

	# Methods
	def draw( app )
		app.line @a.x, @a.y, @b.x, @b.y
		#app.shape
	end
	
end
