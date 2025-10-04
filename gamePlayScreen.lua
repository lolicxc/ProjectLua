local Car = require("car")
local grid = require("grid") -- importante, para usar grid.cellSize
local gameplay = {}
local bgImage
local bgScroll = 0

local cars = {}       -- tabla local de autos
local spawnTimer = 0
local spawnInterval = 2 -- segundos entre cada auto

local function spawnCar()
    -- elegir una fila aleatoria para el auto
    local row = math.random(2, 10)
    local y = (row-1) * grid.cellSize + bgScroll + (grid.cellSize - 20)/2
    local x = -40                    -- inicio desde la izquierda
    local speed = math.random(3, 6)
    local car = Car.new(x, y, speed, 1)
    table.insert(cars, car)
end

function gameplay.load()
    bgImage = love.graphics.newImage("street.png")
end

function gameplay.update(dt)
    -- actualizar autos
    for i, car in ipairs(cars) do
        car:update()
    end

    -- manejar spawn de autos
    spawnTimer = spawnTimer + dt
    if spawnTimer >= spawnInterval then
        spawnCar()
        spawnTimer = 0
    end
end

function gameplay.moveUp()
    bgScroll = bgScroll + grid.cellSize
    local imgH = bgImage:getHeight()
    if bgScroll >= imgH then
        bgScroll = bgScroll - imgH
    end
end

function gameplay.draw()
    local imgH = bgImage:getHeight()
    love.graphics.draw(bgImage, 0, bgScroll)
    love.graphics.draw(bgImage, 0, bgScroll - imgH)

    -- dibujar autos
    for i, car in ipairs(cars) do
        car:draw()
    end
end

return gameplay
