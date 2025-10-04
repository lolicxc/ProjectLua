local grid = {}

grid.cellSize = 40
grid.cols = 20
grid.rows = 15

-- grilla a píxeles
function grid.gridToPixel(col, row)
    local x = (col - 1) * grid.cellSize
    local y = (row - 1) * grid.cellSize
    return x, y
end

-- debug visual
function grid.draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    for c = 1, grid.cols do
        for r = 1, grid.rows do
            local x, y = grid.gridToPixel(c, r)
            love.graphics.rectangle("line", x, y, grid.cellSize, grid.cellSize)
        end
    end
    love.graphics.setColor(1, 1, 1) -- reset color
end

return grid