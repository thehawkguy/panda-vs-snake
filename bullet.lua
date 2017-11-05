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
      self.y = self.y + player.bulletSpeed * dt
    else
      self.y = self.y - enemy.bulletSpeed * dt
  end

  if self.y > Settings.WindowHeight or self.y < 0 then
    self.isDead = true
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
    -- wenn die bullets zum panda gehören, dann:
    -- wenn sie ein bulletspeed Up treffen
    if self.character == player and obj.k == 1 then
      player.bulletSpeed = player.bulletSpeed * 1.33
    -- wenn sie ein health Up treffen
    elseif self.character == player  and obj.k == 2 and player.health <= 80 then
      player.health = player.health + math.random(8, 18)
    -- wenn sie ein firerate up treffen
    elseif self.character == player  and obj.k == 3 then
      if player.fireCap > 0.2 then
        player.fireCap = player.fireCap - 0.2
      end
    -- wenn sie ein speed Up treffen
    elseif self.character == player  and obj.k == 4 then
      player.speed = player.speed * 1.33
    -- wenn die bullets zur schlange gehören, dann:
    -- etc.
    elseif self.character == enemy and obj.k == 1 then
      enemy.bulletSpeed = enemy.bulletSpeed * 1.33

    elseif self.character == enemy and obj.k == 2 and enemy.health <= 80 then
      enemy.health = enemy.health + math.random(8, 18)

    elseif self.character == enemy and obj.k == 3 then
      if enemy.fireCap > 0.2 then
        enemy.fireCap = enemy.fireCap - 0.2
      end

    elseif self.character == enemy and obj.k == 4 then
      enemy.speed = enemy.speed * 1.33
    end

    obj.isDead = true
    self.isDead = true

  end

end