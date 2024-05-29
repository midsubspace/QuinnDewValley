import "CoreUtils"
ensureImport "move"
ensureImport "tools"
ensureImport "colors"
StartPos={"x":53,"y":13}
shit=function
    row=1
    StartPos={"x":53,"y":13}
    FieldPos={"x1":53,"x2":49,"y1":14}
    FieldRows={"1":{"x1":53,"x2":49,"y":14},"2":{"x1":53,"x2":49,"y":15},"3":{"x1":53,"x2":49,"y":16}}
    next=function()
    if me.position.y==13 then
        print "Going Left"
        move.faceDir(move.west)
        me.forward
        move.faceDir(move.south)
    else if me.position.y==14 then
        print "Going Right"
        move.faceDir(move.east)
        me.forward
        move.faceDir(move.south)
    else if me.position.y==15 then
        print "Going Left"
        move.faceDir(move.west)
        me.forward
        move.faceDir(move.south)
    end if
    end function
    job=function()
        if me.ahead==null then
            while me.ahead==null
                print "Ahead=null"
                me.left
            end while
        else if me.ahead.type=="Character" then
            world.chat("Get Outa my way")
            input("Have You Moved Yet Dickwad?")
        else if me.ahead.crop==null then
            move.faceDir(move.south)
            tools.plant("Parsnip Seeds")
        else if me.ahead.crop.harvestable==1 then
            move.faceDir(move.south)
            tools.harvest
        else if me.ahead.dry==1 then
            move.faceDir(move.south)
            tools.water
        else
            next
        end if
    end function
    if row==1 then
        while me.position.x!=FieldPos.x2
            job()
        end while
        if me.position.x==FieldPos.x2 then
            move.faceDir(move.south)
            job()
            me.forward
            row=2
        end if
    end if
    if row==2 then
        while me.position.x!=FieldPos.x1
            job()
        end while
        if me.position.x==FieldPos.x1 then
            job()
            me.forward
            row=3
        end if
    end if
    if row==3 then
        while me.position.x!=FieldPos.x2
            job()
        end while
        if me.position.x==FieldPos.x2 then
            job()
            move.faceDir(move.south)
            me.forward
            row=0
        end if
    end if
    if row==0 then
        move.goTo(StartPos.x,StartPos.y)
        me.statusColor=colors.colors.white
        world.chat("Done With My Tasks")
    end if
end function

home=function
    move.goTo(StartPos.x,StartPos.y)
end function
