require "character"
Enemy = Character:extend()

function Enemy:new(x, y, speed, width)
  Enemy.super.new(self, x, y, speed, width, health)
  self.image = love.graphics.newImage("snake.png")
  self.width = self.image:getWidth()
  self.height= self.image:getHeight()
  self.side = "bottom"
  self.xBullet = self.width / 2 + Settings.BulletHOffset
  self.yBullet = - Settings.BulletHeight - 1
  self.DrawFlipY = -1
  self.DrawOffsetY = Settings.SnakeHeight
  self.keyLeft = "left"
  self.keyRight = "right"
  self.keyFire = "up"
  self.name = "Snake"
end
