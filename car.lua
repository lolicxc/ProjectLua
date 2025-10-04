-- car.lua
local Car = {}
Car.__index = Car

function Car.new(x, y, speed, direction)
    local self = setmetatable({}, Car)
    self.x = x or 0
    self.y = y or 250
    self.w = 40
    self.h = 20
    self.speed = speed or 5
    self.direction = direction or 1
    return self
end

function Car:update()
    self.x = self.x + self.speed * self.direction
    if self.x > love.graphics.getWidth() then
        self.x = -self.w
    end
    if self.x + self.w < 0 then
        self.x = love.graphics.getWidth()
    end
end

function Car:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1)
end

return Car
