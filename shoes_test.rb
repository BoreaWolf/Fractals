# Shoes tests
# Riccardo Orizio
# 30 June 2016

# 1.
#	Shoes.app{ button "push me" }

# 2.
#	Shoes.app {
#		background white
#		stack( margin: 8 ){
#			button "Sbra"
#			button "b"
#			button "r"
#			button "a"
#		}
#	}

# 3.
Shoes.app do
	background white

	stack( margin: 12 ) do

		@oval = oval(	left: 10,
						top: 10,
						radius: 40 )

		fill red
		@rect = rect(	left: 50,
						top: 10,
						width: 40 )

		fill blue
		@arrow = arrow(	left: 30,
						top: 60,
						width: 40 )

		@note = para "Nothing"

		@oval.click{ @note.replace "Clicked oval" }
		@rect.click{ @note.replace "Clicked rect" }
		@arrow.click{ @note.replace "Clicked arrow" }
	end
end
