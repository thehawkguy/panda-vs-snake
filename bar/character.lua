Character = Object:extend()

function Character:new(x, y, speed, width, height, side, health, dead)
  self.x = x
  self.y = y
  self.speed = speed
  self.width = width
  self.height = height
  self.side = side
  self.health = 100
  isDead = false
  
end

function Character:update(dt)
  
  if self.side == "bottom" then
    keyOne = "left"
    keyTwo = "right"
    keyThree = "up"
  elseif self.side == "top" then
    keyOne = "a"
    keyTwo = "d"
    keyThree = "space"
  end
    
  if love.keyboard.isDown(keyOne) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown(keyTwo) then
    self.x = self.x + self.speed * dt
  end
  
  window_width = love.graphics.getWidth()
  
  if self.x < 0 then
    self.x = 0  
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
  
  if self.side == "top" then
    xB = self.x + xBulP 
    yB = self.y + yBulP
  else
    xB = self.x + xBulE
    yB = self.y - yBulE
  end
  
  if love.keyboard.isDown(keyThree) and timeBottom >= 1 and self.side == "bottom" then
    table.insert(listOfBullets, Bullet(xB, yB, self.side))
    timeBottom = 0
  elseif love.keyboard.isDown(keyThree) and timeTop >=1 and self.side == "top" then
    table.insert(listOfBullets, Bullet(xB, yB, self.side))
    timeTop = 0
  end
  
  if self.health <= 0 then
    self.isDead = true
  end
  
    
end

function Character:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
