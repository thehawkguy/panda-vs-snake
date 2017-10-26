require "character"
Player = Character:extend()

function Player:new(x, y, speed, width, height, side, health, dead)
  Player.super.new(self, x, y, speed, health)
  self.image = love.graphics.newImage("panda.png")
  self.width = self.image:getWidth()
  self.height= self.image:getHeight()
  self.side = "top"
  xBulP = self.width / 2
  yBulP = self.height + 1
end


