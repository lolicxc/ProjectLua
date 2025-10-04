local gameplay = require("gamePlayScreen")
local player = require("player")
local grid = require("grid")

function love.load()
    love.graphics.setBackgroundColor(0.5,0.5,1)
    winW = love.graphics.getWidth()
    winH = love.graphics.getHeight()
    gameplay.load()
end

function love.update(dt)
    gameplay.update(dt,player)  -- muy importante
end

function love.keypressed(key)
    if key == "up" then
        player.keypressed(key)
        gameplay.moveUp()
    else
        player.keypressed(key)
    end
end

function love.draw()
    gameplay.draw()
    grid.draw()   -- opcional para debug
    player.draw()
end
