require "settings"

require "character"
Player = Character:extend()

function Player:new(x, y, speed)
  Player.super.new(self, x, y, speed, health)
  self.image = love.graphics.newImage("panda.png")
  self.width = self.image:getWidth()
  self.height= self.image:getHeight()
  self.side = "top"
  self.xBullet = self.width / 2 + Settings.BulletHOffset;
  self.yBullet = self.height + 1
  self.DrawFlipY = 1
  self.keyLeft = "a"
  self.keyRight = "d"
  self.keyFire = "space"
  self.name = "Panda"
end
