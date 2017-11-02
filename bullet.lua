require "entity"
Bullet = Entity:extend()

function Bullet:new(character)
  self.image = Settings.BulletImage
  self.character = character
  self.x = character.x + character.xBullet
  self.y = character.y + character.yBullet
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.isDead = false
  
  widthBulletHalfed = self.width / 2
  
end

function Bullet:update(dt)
  
  if self.character == player then
      self.y = self.y + Settings.bulletSpeedPanda * dt
    else
      self.y = self.y - Settings.bulletSpeedSnake * dt
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
    
    self.isDead = true    

    obj.health = obj.health - 10
  end
end

function Bullet:checkCollisionPUp(obj)
  local self_left = self.x
  local self_right = self.x + self.width
  local self_top = self.y
  local self_bottom = self.y + self.height
  
  local obj_left = obj.x
  local obj_right = obj.x + Settings.pUpWidth
  local obj_top = obj.y
  local obj_bottom = obj.y + Settings.pUpHeight

  if self_right > obj_left and
  self_left < obj_right and
  self_bottom > obj_top and
  self_top < obj_bottom then

      if self.character == player and obj.k == 1 then
        Settings.bulletSpeedPanda = Settings.bulletSpeedPanda * 1.33
      elseif self.character == player  and obj.k == 2 then
        player.health = player.health + math.random(8, 18)
      elseif self.character == player  and obj.k == 3 then
        player.fireCap = player.fireCap - 0.2
      elseif self.character == player  and obj.k == 4 then
        player.speed = player.speed * 1.33
      elseif self.character == enemy and obj.k == 1 then
        Settings.bulletSpeedSnake = Settings.bulletSpeedSnake * 1.33
      elseif self.character == enemy and obj.k == 2 then
        enemy.health = enemy.health + math.random(8, 18)
      elseif self.character == enemy and obj.k == 3 then
        enemy.fireCap = enemy.fireCap - 0.2
      elseif self.character == enemy and obj.k == 4 then
        enemy.speed = enemy.speed * 1.33
      end

      obj.isDead = true

  end

end


  