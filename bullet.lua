Bullet = Object:extend()

function Bullet:new(x, y, side)
  self.image = love.graphics.newImage("bullet.png")
  self.x = x
  self.y = y  
  self.speed = 700
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.side = side
  
end

function Bullet:update(dt)
  
  self.speed = 0
  if self.side == "top" then
      self.y = self.y + self.speed * dt
    else
      self.y = self.y - self.speed * dt
  end
    
end

function Bullet:draw()
   
  love.graphics.draw(self.image, self.x, self.y)
  
end

function Bullet:checkCollision(obj)
  local self_left = self.x
  local self_right = self.x + self.width
  local self_top = self.y
  local self_bottom = self.y + self.height
  
  local obj_left = obj.x
  local obj_right = obj.x + obj.width
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.height
  
  if self_right > obj_left and
  self_left < obj_right and
  self_bottom > obj_top and
  self_top < obj_bottom then
    
    self.dead = true    
    obj.health = obj.health -1
  end
end

  