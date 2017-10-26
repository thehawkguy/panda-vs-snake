SettingsClass = Object:extend()

function SettingsClass:new()
    self.BulletImage = love.graphics.newImage("bullet.png")
    self.BulletWidth = self.BulletImage:getWidth()
    self.BulletHOffset = - (self.BulletWidth / 2)
    self.BulletHeight = self.BulletImage:getHeight()
    self.SnakeImage = love.graphics.newImage("snake.png")
    self.SnakeHeight = self.SnakeImage:getHeight()
    self.SnakeWidth = self.SnakeImage:getWidth()

end

Settings = SettingsClass()
    