local json = require 'dkjson'
local debuggee = require 'vscode-debuggee'
local startResult, breakerType = debuggee.start(json)
print('debuggee start ->', startResult, breakerType)

debuggee.poll()

function love.load()
  Object = require "classic"
  require "hawkkeys"
  require "entity"
  require "player"
  require "enemy"
  require "bullet"
  require "healthbar"
  
  
  gameRunning = true
  
  player = Player(640, 45, 500)
  enemy = Enemy(640, 570, 500)
  healthbarpanda = HealthBar(5, player)
  healthbarsnake = HealthBar(680, enemy)
  listOfBullets = {}

end

function love.update(dt)
  if gameRunning then
    player:update(dt)
    enemy:update(dt)
      
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

  debuggee.poll()

  player:draw()
  enemy:draw()
  healthbarsnake:draw()
  healthbarpanda:draw()
  
  for i,v in ipairs(listOfBullets) do
    v:draw(dt)
  end  
  
  love.graphics.print("Movement of the panda: left = a, right = d, shoot = space", 400, 10)
  love.graphics.print("Movement of the snake: left = left arrow, right = right arrow, shoot = up arrow", 400, 685)
  
  if gameRunning == false and player.isDead then
    love.graphics.print("Gratz, the snake has won! Please press 'R' to restart.", 300, 350, 0, 2)
  elseif gameRunning == false and enemy.isDead then
    love.graphics.print("Gratz, the panda has won! Please press 'R' to restart.", 300, 350, 0, 2)
  end
  

  
end
