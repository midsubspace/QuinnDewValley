load "q"
counts = {}
total = 0


AllFields=function()
	for x in range(0, farm.width)
		for y in range(0, farm.height)
			t = farm.tile(x,y)
			if not t then continue
			if t.type!="HoeDirt" then continue
			print t.crop.name+":"+t.crop.phase+"/"+t.crop.maxPhase
		end for
	end for
end function
field1=function()
	Plot={"x1":68,"x2":74,"y":22}
	for x in range(Plot.x1,Plot.x2)
			t = farm.tile(x,22)
			if not t then continue
			if t.type!="HoeDirt" then continue
			water="Watered"
			if t.dry==1 then water="Needs Water"
			print t.crop.name+" "+t.crop.phase+"/"+t.crop.maxPhase+" "+water
	end for
end function

field1