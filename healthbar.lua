require "entity"
HealthBar = Entity:extend()

function HealthBar:new(y, character)
    self.x = 5
    self.y = y
    self.width = 350
    self.height = 35
    self.character = character
  end

function HealthBar:draw()
    local r, g, b, a = love.graphics.getColor()
    local health = self.character.health

    local colorRed = 255 - health * 2.55
    local colorGreen = health * 2.55

    local borderR, borderG, borderB = 0, 155, 155
    if (health <= 0) then
        borderR = 255
        borderG = 0
        borderB = 0    
    else
        love.graphics.setColor(colorRed, colorGreen, 0, 255)
        love.graphics.rectangle("fill", self.x + 1, self.y + 1, health * (self.width / 100), self.height - 2)
    end
    love.graphics.setColor(borderR, borderG, borderB, 255)
    love.graphics.rectangle("line", self.x, self.y, self.width + 2, self.height)

    --love.graphics.rectangle("fill", 0, 0, 100, 100)
    love.graphics.setColor(r, g, b, a)
end