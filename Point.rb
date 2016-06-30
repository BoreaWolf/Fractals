#
# Author: Riccardo Orizio (R)
# Date: 30 June 2016
#
# Description: Point class used for defining a Line
#

class Point

	# Array of all points created
	@@array = Array.new
	@@radius = 5
	attr_accessor :x, :y

	def self.all_instances
		@@array
	end

	def initialize( x, y )
		@x = x
		@y = y
		# Adding the last element created to the list
		@@array << self
	end

	def draw( app )
		app.oval(	left: @x - @@radius,
					top: @y - @@radius,
					radius: @@radius )
	end

end
