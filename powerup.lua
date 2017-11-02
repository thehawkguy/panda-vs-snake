require "entity"
PowerUp = Entity:extend()

function PowerUp:new()
    -- powerups sollen in mitte der fensterhöhe gespawnt werden, zufällig zur fensterbreite; sie bekommen ein bild.
    -- sie haben eine art (k)
    self.x = math.random(Settings.xRand1, Settings.xRand2)
    self.y = (Settings.WindowHeight / 2) - (Settings.pUpHeight / 2)
    self.image = love.graphics.newImage(imagePowerUp)
    self.k = k
    self.isDead = false

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

function PowerUp:draw(  )

    love.graphics.draw(self.image, self.x, self.y)

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