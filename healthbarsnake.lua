HealthBarSnake = Object:extend()

function HealthBarSnake:new(x, y, image)
  self.x = x
  self.y = y
  PathImage = "bar/bar_10.png"
  self.image = love.graphics.newImage(PathImage)
end
function HealthBarSnake:update(dt)
  
  if enemy.health == 100 then
    PathImage = "bar/bar_10.png"
  elseif enemy.health < 100 and enemy.health > 89  then
    PathImage = "bar/bar_9.png"
  elseif enemy.health < 90 and enemy.health > 79   then
    PathImage = "bar/bar_8.png"
  elseif enemy.health < 80 and enemy.health > 69  then
    PathImage = "bar/bar_7.png"
  elseif enemy.health < 70 and enemy.health > 59 then
    PathImage = "bar/bar_6.png"
  elseif enemy.health < 60 and enemy.health > 49 then
    PathImage = "bar/bar_5.png"
  elseif enemy.health < 50 and enemy.health > 39 then
    PathImage = "bar/bar_4.png"
  elseif enemy.health < 40 and enemy.health > 29 then
    PathImage = "bar/bar_3.png"
  elseif enemy.health < 30 and enemy.health > 19 then
    PathImage = "bar/bar_2.png"
  elseif enemy.health < 20 and enemy.health > 9 then
    PathImage = "bar/bar_1.png"
  elseif enemy.health < 10 and enemy.health > 0 then
    PathImage = "bar/bar_0.png"
  elseif enemy.health <= 0 then
    PathImage = "bar/bar_hit.png"
  end
 
  self.image = love.graphics.newImage(PathImage)
end

function HealthBarSnake:draw()
  
  love.graphics.draw(self.image, self.x, self.y, 0, 1, sx)
  
end

