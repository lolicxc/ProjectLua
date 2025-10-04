local grid = require("grid")

local player = {
    gridX = 5,
    gridY = 10,
    w = grid.cellSize,
    h = grid.cellSize
}

function player.keypressed(key)
    if key == "right" then
        player.gridX = math.min(player.gridX + 1, grid.cols)
    elseif key == "left" then
        player.gridX = math.max(player.gridX - 1, 1)
    elseif key == "up" then
        player.gridY = player.gridY - 1
        -- 🚀 en vez de mover al player en Y, avisamos al gameplay que se "desplace"
    elseif key == "down" then
        player.gridY = player.gridY + 1
    end
end

function player.draw()
    -- el player siempre en el mismo Y de pantalla (ej: fijo abajo)
    local screenX = (player.gridX - 1) * grid.cellSize
    local screenY = 400  -- valor fijo: player queda en la parte baja
    love.graphics.rectangle("fill", screenX, screenY, player.w, player.h)
end

return player
