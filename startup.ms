load "startup"
import "CoreUtils"
ensureImport "bot0"
ensureImport "bot1"
clear

if me.name=="Farmtronics Bot 0" then 
    bot0.shit
else if me.name=="bot1" then
    bot1.DailyTask(map.Field2Width,map.Field2Height)
    bot1.home
    me.statusColor=colors.colors.white
    world.chat("Done With My Chores!")
else
    field1=function()
        Plot={"x1":53,"x2":74,"y":22}
        for x in range(Plot.x1,Plot.x2)
                t = farm.tile(x,Plot.y)
                if not t then continue
                if t.type!="HoeDirt" then continue
                water="Watered"
                if t.dry==1 then water="Needs Water"
                if t.crop then print t.crop.name+" "+t.crop.phase+"/"+t.crop.maxPhase+" "+water
        end for
    end function
    //print "Welcome Quinn"
    //print "Current Season: "+world.seasonName
    //print world.dayOfSeason+"/28("+floor((world.dayOfSeason/28)*100)+"%)"
    //print 28-world.dayOfSeason+" Days Left"
    //input("Press any Key to continue")
    //field1
end if