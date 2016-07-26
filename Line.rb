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
	# Drawing the line as defined
	def draw( app )
		app.line @a.x, @a.y, @b.x, @b.y
		#app.shape
	end

	# Splitting the current line into 4 sub-lines
	#  - Divide the line into 3 equal segments
	#  - Draw an equilateral triangle on the middle segment
	#  - Delete the base line of the triangle
	#
	# A         B
	# o---------o
	#
	#       E
	#       o
	#      / \
	# o---o  o---o
	# A   C  D   B
	#
	#
	def split()
		# I need to find from the two points that define this line the set of 5
		# points to generate all the lines required
		#line_length = Math.sqrt( ( @a.x - @b.x ) ** 2 + ( @a.y - @b.y ) ** 2 )
		#c = Point.new( @a.x + 3/line_length * (

		dx = @a.x - @b.x
		dy = @a.y - @b.y
		line_length = Math.sqrt( dx ** 2 + dy ** 2 )
		dx /= line_length
		dy /= line_length

		opposite = @a.y - @b.y
		adiacent = @a.x - @b.x
		hypo = Math.sqrt( opposite ** 2 + adiacent ** 2 )

		#c = Point.new( @a.x + 3/line_length * dx, @a.y + 3/line_length * dy )
		#d = Point.new( @a.x + 6/line_length * dx, @a.y + 6/line_length * dy )
		#	c = Point.new( @a.x + line_length * 1/3, 
		#				   @a.y + dy * line_length * 1/3 )

		#	d = Point.new( @a.x + line_length * 2/3,
		#				   @a.y + dy * line_length * 2/3 )

		c = Point.new( @a.x + line_length/3 * Math.cos( adiacent / hypo ),
					   @a.y + line_length/3 * Math.sin( opposite / hypo ) )
		
		d = Point.new( @a.x + line_length * 2/3 * Math.cos( adiacent / hypo ),
					   @a.y + line_length * 2/3 * Math.sin( opposite / hypo ) )

		# Knowing that it is an equilater triangle, I know its angle
		e = Point.new( c.x + line_length/3 * Math.cos( Math::PI/3 ),
					   c.y + line_length/3 * Math.sin( Math::PI/3 ) )

		# Creating the new lines from these points
		Line.new( @a, c )
		Line.new( c, e )
		Line.new( e, d )
		Line.new( d, @b )
	end
	
end
