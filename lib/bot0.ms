import "CoreUtils"
ensureImport "move"
ensureImport "tools"
ensureImport "colors"
ensureImport "map"
FieldPos=map.FieldPos1
shit=function
    me.statusColor=colors.colors.green
    FieldPos=map.FieldPos
    while me.ahead==null
        print "Ahead=null"
        yield
        me.left
    end while
    if me.ahead.type!="HoeDirt" then me.left
    skip=0
    while me.position.x!=FieldPos.x2
        while me.ahead==null
            print "Ahead=null"
            move.faceDir(move.south)
        end while
        if me.ahead.type=="Character" then
            world.chat("Get Outa my way")
            input("Press any key to continue")
        else if me.ahead.crop!=null and me.ahead.crop.harvestable==1 then
            tools.harvest
        else if me.ahead.crop!=null and me.ahead.dry==1 then
            tools.water
        else if world.seasonName=="spring" and skip==0  then 
            if 28-world.dayOfSeason<4 and me.ahead.crop==null then
                wait 0.1
                move.faceDir(move.east)
                me.forward
            else if 28-world.dayOfSeason>4 and me.ahead.crop==null then
                tools.plant("Parsnip Seeds")
            else
                skip=1
            end if
        else if world.seasonName=="summer" and skip==0 then
            if 28-world.dayOfSeason<4 and me.ahead.crop==null then
                wait 0.1
                move.faceDir(move.east)
                me.forward
            else if 28-world.dayOfSeason>4 and me.ahead.crop==null then
                tools.plant("Wheat Seeds")
            else
                skip=1
            end if
        else
            print "Going Right"
            move.faceDir(move.east)
            me.forward
            skip=0
        end if
    end while
    if me.position.x!=FieldPos.x1 then move.goTo(FieldPos.x1,FieldPos.y)
    tools.unload
    me.statusColor=colors.colors.white
    world.chat("Done With My Tasks")
end function

home=function();move.goTo(FieldPos.x1,FieldPos.y);end function