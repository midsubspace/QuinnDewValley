import "CoreUtils"
ensureImport "move"
ensureImport "tools"
ensureImport "colors"

shit=function()
    for x in range(62,65)
        for y in range(26,28)
            if y==25 then
                while me.position.x!=66
                    move.faceDir(move.south);tools.plow;me.faceDir(move.east);me.forward
                end while
            else if y==26 then
                me.left;move.faceDir(move.south);tools.plow;me.left;me.forward
            else if y==27 then
                me.right;move.faceDir(move.south);tools.plow;me.right;me.forward
            end if
        end for
    end for
end function
home=function();move.goTo(62,25);end function
if me.position.x==62 and me.position.y==25 then shit