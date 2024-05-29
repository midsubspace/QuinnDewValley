
start=input("Starting Cords: x,y: ")
x1=start.split(",")[0].val
y1=start.split(",")[1].val
stop=input("Ending Cords:x,1: ")
x2=stop.split(",")[0].val
y2=stop.split(",")[1].val



clearGrid = function(width, height)
  for h in range(0, height-1)
    me.clearAndMove width
    if h % 2 then
      me.right; me.clearAndMove; me.right
    else
      me.left; me.clearAndMove; me.left
    end if
  end for
end function
clearGrid(abs(x2-x1),abs(y2-y1))