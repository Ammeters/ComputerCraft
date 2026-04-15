local function dropall(item)
    local count = 0
    for i = 1, 11, 1 do
        turtle.select(i)
        if turtle.getItemDetail() == item then
            turtle.drop()
            count = count + 1
        end
    end
    return count
end


local function suckall()
    local temp = true
    while temp do
        temp = turtle.suck()
    end
end

local function refuel()
    turtle.turnRight()
    turtle.forward()
    turtle.suck()
    turtle.refuel()
    turtle.back()
    turtle.turnLeft()
end

local function burnallbut(item)
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    redstone.setOutput("front", true)
        for i = 1, 11, 1 do
        turtle.select(i)
            if turtle.getItemDetail() == item then
            turtle.drop()
            end
        end
    redstone.setOutput("front", false) 
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
end

local function blow(type, item)
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.select(type)
    turtle.place()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    dropall(item)
    sleep(31)
    suckall()
    turtle.select(2)
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    turtle.select(type)
    turtle.place()
    turtle.back()
    turtle.back()
    turtle.back()
    turtle.back()
    turtle.turnRight()
end

local function crush(item)
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.up()
    turtle.up()
    local count = dropall(item)
    turtle.down()
    turtle.down()
    sleep((7*count)+1)
    suckall()
end