north=0
east=1
south=2
west=3

faceDir = function(dir)
  while me.facing != dir 
    me.right 
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

moveDir=function(dir)
  faceDir(dir)
  me.forward
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

print "Loaded Move Lib"