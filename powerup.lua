require "entity"
PowerUp = Entity:extend()

function PowerUp:new(x, y)
    -- powerups sollen in mitte der fensterhöhe gespawnt werden, zufällig zur fensterbreite; sie bekommen ein bild. sie haben eine art (k)
    self.x = math.random(Settings.xRand1, Settings.xRand2)
    self.y = (Settings.WindowHeight / 2) - (Settings.pUpHeight / 2)
    self.image = love.graphics.newImage(imagePowerUp)
    self.k = k
    self.isDead = true

end

function PowerUp:update(dt)
    -- body
    timePUp = timePUp + dt
    if timePUp >= 5 then
        PowerUp:random()
        table.insert(listOfPUps, PowerUp(self))
        timePUp = 0
    end

end

function PowerUp:draw( ... )

    love.graphics.draw(self.image, self.x, self.y)

    --entwicklerzeugs
    love.graphics.print(tostring(self.k), 10, 200)
    love.graphics.print(tostring(Settings.pUpHeight), 10, 230)
    love.graphics.print(tostring(player.speed), 10, 260)
    love.graphics.print(tostring(enemy.speed), 10, 290)
    love.graphics.print(tostring(Settings.bulletSpeedPanda), 10, 310)
    love.graphics.print(tostring(Settings.bulletSpeedSnake), 10, 330)
end

function PowerUp:random()
   self.k = math.random(4)
   if self.k == 1 then
    imagePowerUp = "element_blue_polygon.png"
   elseif self.k == 2 then
    imagePowerUp = "element_green_polygon.png"
   elseif self.k == 3 then
    imagePowerUp = "element_purple_polygon.png"
   elseif self.k == 4 then
    imagePowerUp = "element_red_polygon.png"
   end
end

-- function PowerUp:checkCollision(obj)
--         local self_left = self.x
--         local self_right = self.x + Settings.pUpWidth
--         local self_top = self.y
--         local self_bottom = self.y + Settings.pUpHeight
        
--         local obj_left = obj.x
--         local obj_right = obj.x + obj.width
--         local obj_top = obj.y
--         local obj_bottom = obj.y + obj.height

--         if self_right > obj_left and
--         self_left < obj_right and
--         self_bottom > obj_top and
--         self_top < obj_bottom then

--             if obj.character == player then
--                 player.speed = player.speed * 1.1
--             else
--                 enemy.speed = enemy.speed * 1.1
--             end
--         end

-- end