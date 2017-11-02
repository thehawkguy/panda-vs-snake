require "entity"
Character = Entity:extend()

function Character:new(x, y, speed, width, height, side)
  self.x = x
  self.y = y
  self.speed = speed
  self.width = width
  self.height = height
  self.side = side
  self.health = 100
  self.isDead = false
  self.timeShot = 0
  self.fireCap = 1
end

function Character:update(dt)

  if love.keyboard.isDown(self.keyLeft) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown(self.keyRight) then
    self.x = self.x + self.speed * dt
  end

  local window_width = love.graphics.getWidth()

  if self.x < 0 then
    self.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end

  self.timeShot = self.timeShot + dt

  if love.keyboard.isDown(self.keyFire) and self.timeShot >= self.fireCap then
    table.insert(listOfBullets, Bullet(self))
    self.timeShot = 0
  end

  if self.health <= 0 then
    self.isDead = true
  end

  if self.health > 100 then
    self.health = 100
  end

end

function Character:draw()
  love.graphics.draw(self.image, self.x, self.y, 0, 1, self.DrawFlipY, 0, self.DrawOffsetY)
end
