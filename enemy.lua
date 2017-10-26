require "character"
Enemy = Character:extend()

function Enemy:new(x, y, speed, width, height, side, health, dead)
  Enemy.super.new(self, x, y, speed, width, health)
  self.image = love.graphics.newImage("snake.png")
  self.width = self.image:getWidth()
  self.height= self.image:getHeight()
  self.side = "bottom"
  xBulE = self.width / 2
  yBulE = 8
end

