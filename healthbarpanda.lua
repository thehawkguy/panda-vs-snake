HealthBarPanda = Object:extend()

function HealthBarPanda:new(x, y, image)
  self.x = x
  self.y = y
  PathImage = "bar/bar_10.png"
  self.image = love.graphics.newImage(PathImage)
end
function HealthBarPanda:update(dt)
  
  if player.health == 100 then
    PathImage = "bar/bar_10.png"
  elseif player.health < 100 and player.health > 89  then
    PathImage = "bar/bar_9.png"
  elseif player.health < 90 and player.health > 79   then
    PathImage = "bar/bar_8.png"
  elseif player.health < 80 and player.health > 69  then
    PathImage = "bar/bar_7.png"
  elseif player.health < 70 and player.health > 59 then
    PathImage = "bar/bar_6.png"
  elseif player.health < 60 and player.health > 49 then
    PathImage = "bar/bar_5.png"
  elseif player.health < 50 and player.health > 39 then
    PathImage = "bar/bar_4.png"
  elseif player.health < 40 and player.health > 29 then
    PathImage = "bar/bar_3.png"
  elseif player.health < 30 and player.health > 19 then
    PathImage = "bar/bar_2.png"
  elseif player.health < 20 and player.health > 9 then
    PathImage = "bar/bar_1.png"
  elseif player.health < 10 and player.health > 0 then
    PathImage = "bar/bar_0.png"
  elseif player.health <= 0 then
    PathImage = "bar/bar_hit.png"
  end
 
  self.image = love.graphics.newImage(PathImage)
end

function HealthBarPanda:draw()
  
  love.graphics.draw(self.image, self.x, self.y, 0, 1, sx)
  
end

