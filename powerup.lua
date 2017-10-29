require "entity"
PowerUp = Entity:extend()

function PowerUp:new( ... )
    -- body
    self x = math.random(Settings.xRand1, xRand2)
    self y = Settings.WindowHeight / 2
    self.image = love.graphics.newImage(imagePowerUp)
    

end

function PowerUp:update( ... )
    -- body

end

function PowerUp:draw( ... )
    -- body
end

