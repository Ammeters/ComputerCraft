local function dropall(item)
    local count = 0
    for i = 1, 11, 1 do
        turtle.select(i)
        local temp = turtle.getItemDetail()
        if temp ~= nil then
            if temp["name"] == item then
                turtle.drop()
                count = count + 1
            end
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
    dropall(item)
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
    turtle.back()
    turtle.back()
    turtle.back()
    turtle.back()
end

local function getstone(n)
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    for i=1, n, 1 do
        turtle.suck()
    end
    turtle.turnLeft()
    turtle.back()
    turtle.back()
end

local function store(item)
    for i = 1, 11, 1 do
        turtle.select(i)
        local temp = turtle.getItemDetail()
        if temp ~= nil then
            if temp["name"] == item then
                turtle.dropDown()
            end
        end
    end
end

--program here

while true do
    getstone(4)
    crush("minecraft:cobblestone")
    crush("minecraft:gravel")
    burnallbut("minecraft:sand")
    blow(15, "minecraft:sand")
    blow(12, "minecraft:soul_sand")
    burnallbut("minecraft:quartz")
    store("minecraft:quartz")
    refuel()

end

