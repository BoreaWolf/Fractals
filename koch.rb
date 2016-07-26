#
# Author: Riccardo Orizio (R)
# Date: 30 June 2016
#
# Description: Koch snowflake fractal
#

require_relative "./Line.rb"
require_relative "./Point.rb"

def draw_all( app )
	Line.all_instances.each{ |x| x.draw( app ) }
	Point.all_instances.each{ |x| x.draw( app ) }
end

Shoes.app :width => 512, :height => 512 do
	background green

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

	#stack do
	#	background white
	Line.all_instances.each{ |x| x.draw( self ) }
	Point.all_instances.each{ |x| x.draw( self ) }
	#end
	
	# Event: next step of the snowflake
	#@intro.click{ @intro2.replace "Sbra" }
		#	Line.all_instances

	click do
		alert( "Sbra" )
		# Splitting the lines as requested to generate the fractal
		# Saving the current lines so I don't fall into an infinite loop
		#	current_lines = Line.all_instances
		#	current_lines.each{ |x| x.split }
		Line.all_instances[0].split
		#Line.all_instances[1].split
		#Line.all_instances[2].split
		# Drawing every line known
		# NB Probably I have to delete the previous lines
		draw_all( self )
	end

end
