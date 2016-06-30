#
# Author: Riccardo Orizio (R)
# Date: 30 June 2016
#
# Description: Koch snowflake fractal
#

require_relative "./Line.rb"
require_relative "./Point.rb"

Shoes.app :width => 512, :height => 512 do
	background green

	@snowflake = flow :width => "100%", height => "100%", margin => 10 do
		background blue

		#	stack :height => 88 do
		#		@intro = para "This will do!"
		#		@intro2 = para "At each click of the mouse you will procede to the next step"
		#	end

		# Starting points
		@a = Point.new( 10, (512-10*2)/4 )
		@b = Point.new( 512-10*2, (512-10*2)/4 )
		@c = Point.new( (512-10*2)/2, (512-10*2) )
		Line.new( @a, @b )
		Line.new( @b, @c )
		Line.new( @c, @a )

		stack do
			background white
			Line.all_instances.each{ |x| x.draw( self ) }
			Point.all_instances.each{ |x| x.draw( self ) }
		end

		# Event: next step of the snowflake
		#@intro.click{ @intro2.replace "Sbra" }
			#	Line.all_instances
	end

	@snowflake.click{ alert( "sbra" ) }

end
