require "entity"
PowerUp = Entity:extend()

function PowerUp:new(x, y)
    -- powerups sollen in mitte der fensterhöhe gespawnt werden, zufällig zur fensterbreite; sie bekommen ein bild. sie haben eine art (k)
    self.x = math.random(Settings.xRand1, xRand2)
    self.y = Settings.WindowHeight / 2
    self.image = love.graphics.newImage(imagePowerUp)


end

function PowerUp:update( ... )
    -- body

end

function PowerUp:draw( ... )
    love.graphics.draw(self.image, self.x, self.y)
end

