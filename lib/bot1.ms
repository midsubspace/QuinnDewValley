import "CoreUtils"
ensureImport "colors"
ensureImport "map"
ensureImport "move"
ensureImport "tools"

watered=0
check_harvest=0

StartPos=map.Field2PosBotStart
WaterPos=map.WaterSource
width=map.Field2Width
height=map.Field2Height

PlowFarm=function(width,height)
    width=width-1
    move.faceDir(move.south)
    for x in range(0,width)
        for y in range(0,height)
            if y!=height then
                move.faceDir(move.south)
                tools.plow
                move.moveDir(move.south)
            else
                for i in range(0,height-1)
                    move.moveDir(move.north)
                end for
            end if
        end for
        if x!=width then
            move.moveDir(move.east)
        else
            for i in range(0,width)
                move.moveDir(move.west)
            end for
        end if
    end for
end function

SowFarm=function(width,height)
    move.faceDir(move.south)
    for x in range(0,width)
        for y in range(0,height)
            if y!=height then
                move.faceDir(move.south)
                tools.plant("Wheat Seeds")
                move.moveDir(move.south)
            else
                for i in range(0,height-1)
                    move.moveDir(move.north)
                end for
            end if
        end for
        if x!=width then
            move.moveDir(move.east)
        else
            for i in range(0,width)
                move.moveDir(move.west)
            end for
        end if
    end for
end function

WaterFarm=function(width,height)
    width=width-1
    move.faceDir(move.south)
    for x in range(0,width)
        for y in range(0,height)
            if y!=height then
                move.faceDir(move.south)
                tools.water
                move.moveDir(move.south)
            else
                for i in range(0,height-1)
                    move.moveDir(move.north)
                end for
            end if
        end for
        if x!=width then
            move.moveDir(move.east)
        else
            for i in range(0,width)
                move.moveDir(move.west)
            end for
        end if
    end for
end function

HarvestFarm=function(width,height)
    width=width-1
    move.faceDir(move.south)
    for x in range(0,width)
        for y in range(0,height)
            if y!=height then
                move.faceDir(move.south)
                if me.ahead.crop.harvestable==1 then tools.harvest
                move.moveDir(move.south)
            else
                for i in range(0,height-1)
                    move.moveDir(move.north)
                end for
            end if
        end for
        if x!=width then
            move.moveDir(move.east)
        else
            for i in range(0,width)
                move.moveDir(move.west)
            end for
        end if
    end for
end function

DailyTask=function(width,height)
    width=width-1
    move.faceDir(move.south)
    for x in range(0,width)
        for y in range(0,height)
            if y!=height then
                move.faceDir(move.south)
                if me.ahead.crop.harvestable==1 then 
                    tools.harvest
                else if me.ahead.dry==1 then
                    tools.water
                end if    
                move.moveDir(move.south)
            else
                for i in range(0,height-1)
                    move.moveDir(move.north)
                end for
            end if
        end for
        if x!=width then
            move.moveDir(move.east)
        else
            for i in range(0,width)
                move.moveDir(move.west)
            end for
        end if
    end for
    move.goTo(StartPos.x,StartPos.y)
end function