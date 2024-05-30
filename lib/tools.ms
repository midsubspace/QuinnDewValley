import "CoreUtils"
ensureImport "colors"
ensureImport "move"
ensureImport "colors"
ensureImport "map"
plant=function(seedname)
    items=[]
    for i in me.inventory
        if i=={} then continue
        items.push(i.name)
    end for
    if items.indexOf(seedname)==null then
        world.chat("Give me some "+seedname)
        me.statusColor=colors.colors.red
        input("Press any key to continue")
        me.statusColor=colors.colors.green
    end if
    me.select seedname
    me.placeItem
    print "Planted "+seedname
end function
water=function()
    me.select("Watering Can")
    for i in me.inventory
        if i=={} then continue
        if i.name=="Watering Can" then
            if i.waterLeft==0 then
                me.statusColor=colors.colors.blue
                old_pos={"x":me.position.x,"y":me.position.y}
                water_source=map.WaterSource
                world.chat("Getting Water")
                move.goTo(water_source.x,water_source.y)
                move.faceDir(move.south)
                me.useTool
                move.goTo(old_pos.x,old_pos.y)
                move.faceDir(move.south)
                me.statusColor=colors.colors.green
            end if
        end if
    end for
    me.useTool
end function
harvest=function()
    me.harvest
end function
plow=function()
    me.select("Hoe")
    if me.ahead==null then me.useTool
end function
unload=function()
    keep=["Watering Can","Hoe","Parsnip Seeds","Axe","Pickaxe","Scythe"]
    old_pos={"x":me.position.x,"y":me.position.y}
    chest_pos={"x":71,"y":20}
    move.goTo(chest_pos.x,chest_pos.y)
    move.faceDir(move.east)
    for i in me.inventory
        if i=={} then continue
        if keep.indexOf(i.name)==null then 
            me.select(i.name)
            me.placeItem
            world.chat("Placed "+i.name+"("+i.stack+") In Chest("+chest_pos.x+","+chest_pos.y+")")
        end if
    end for
    move.goTo(old_pos.x,old_pos.y)
    move.faceDir(move.south)
end function
print "Loaded Tools Lib"