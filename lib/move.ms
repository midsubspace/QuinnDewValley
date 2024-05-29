north=0
east=1
south=2
west=3

faceDir = function(dir)
  dir = dir % 4
  if dir < 0 then dir = dir + 4 
  while me.facing != dir 
    me.left 
   end while 
  end function 

faceLoc = function(x,y) 
 dx = x - me.position.x 
 dy = y - me.position.y 
 if abs(dx) > abs(dy) then
    if dx > 0 then target=1 else target=3
  else
    if dy > 0 then target=2 else target=0
  end if
   faceDir target
end function

goTo = function(x,y)
  print "Going to " + x + ", " + y
  while me.position.x != x or me.position.y != y
    faceLoc x, y
    if me.ahead and not me.ahead.passable then me.clearAhead
    me.forward
    print "Now at " + me.position.x + ", " + me.position.y
  end while
end function

world.chat "Loaded Move Lib"