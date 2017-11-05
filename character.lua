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
  self.bulletSpeed = 700
  self.damage = 10
end

function Character:update(dt)

  if self.joystick then

    if self.joystick:getGamepadAxis("leftx") < -0.1 then
      self.x = self.x - self.speed * dt
    elseif self.joystick:getGamepadAxis("leftx") > 0.1 then
      self.x = self.x + self.speed * dt
    end

    if self.joystick:isGamepadDown("a") and self.timeShot >= self.fireCap then
      table.insert(listOfBullets, Bullet(self))
      self.timeShot = 0
    end

  end

  if love.keyboard.isDown(self.keyLeft) then
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.isDown(self.keyRight) then
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

end

function Character:draw()
  love.graphics.draw(self.image, self.x, self.y, 0, 1, self.DrawFlipY, 0, self.DrawOffsetY)
end
