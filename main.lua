function love.load()
  Object = require "classic"
  require "hawkkeys"
  require "player"
  require "enemy"
  require "bullet"
  require "healthbarsnake"
  require "healthbarpanda"
  
  timeTop = 0
  timeBottom = 0
  
  gameRunning = true
  
  --gw = love.graphics.getWidth()
  --gh = love.graphics.getHeight()
  
  player = Player(640, 45, 500)
  enemy = Enemy(640, 570, 500)
  healthbarpanda = HealthBarPanda(5, 5)
  healthbarsnake = HealthBarSnake(5, 680)
  listOfBullets = {}

end

function love.update(dt)
  if gameRunning then
    player:update(dt)
    enemy:update(dt)
    healthbarsnake:update(dt)
    healthbarpanda:update(dt)
    
    timeTop = timeTop + dt
    timeBottom = timeBottom + dt
      
    for i,v in ipairs(listOfBullets) do
      v:update(dt)
      v:checkCollision(enemy)
      v:checkCollision(player)
    end
    
    if player.isDead or enemy.isDead then
    gameRunning = false
    
  end    
   

end
end

function love.draw()
  player:draw()
  enemy:draw()
  healthbarsnake:draw()
  healthbarpanda:draw()
  
  for i,v in ipairs(listOfBullets) do
    v:draw(dt)
  end  
  
  healthbarsnake:draw()
  healthbarpanda:draw()
  
  love.graphics.print("Movement of the panda: left = a, right = d, shoot = space", 400, 10)
  love.graphics.print("Movement of the snake: left = left arrow, right = right arrow, shoot = up arrow", 400, 685)
  --love.graphics.print(timeTop, 500, 300)
  --love.graphics.print(timeBottom, 500, 400)
  --love.graphics.print(player.health, 200, 300)
  --love.graphics.print(enemy.health, 200, 400)
  --love.graphics.print(PathImage, 200, 350)   
  --love.graphics.print(gw, 200, 100)   
  --love.graphics.print(gh, 200, 150) 
  
  if gameRunning == false and player.isDead then
    love.graphics.print("Gratz, the snake has won! Please press 'R' to restart.", 300, 350, 0, 2)
  elseif gameRunning == false and enemy.isDead then
    love.graphics.print("Gratz, the panda has won! Please press 'R' to restart.", 300, 350, 0, 2)
  end
  

  
end
