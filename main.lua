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
  require "settings"
  
  -- Wir möchten eine Pause-Funktion haben, primär für das "Game Over" - daher ein bool den wir eingangs auf true setzen
  gameRunning = true
  
  -- sämtliche entities (s. auch entity class) werden initialisiert
  player = Player(Settings.pandaX, 45, 500)
  enemy = Enemy(Settings.snakeX, 570, 500)
  healthbarpanda = HealthBar(5, player)
  healthbarsnake = HealthBar(Settings.healthbarSnakeY, enemy)
  listOfBullets = {}
  listOfPowerUps = {}

end

function love.update(dt)

  --local joysticks = love.joystick.getJoysticks()
  --error(table.getn(joysticks))

  -- Settings machen nur Hintergrundsachen. Beispielsweise für die dynamische Auflösung, daher müssen sie immer updaten
  Settings:update()

  -- der Rest soll pausiert werden,sobald gameover ist, daher hier die if-Schleife, die den bool checkt
  if gameRunning then
    -- die beiden Charaktere: die Schlange (enemy) und der Panda (player) werden geupdated
    player:update(dt)
    enemy:update(dt)
     
    -- die bullets werden geupdated und nach Kollisionen gecheckt
    for i,v in ipairs(listOfBullets) do
      v:update(dt)
      v:checkCollision(enemy)
      v:checkCollision(player)
    end

    -- for i,v in ipairs(listOfPowerUps) do
      -- v:update(dt)
      -- v:checkCollision(Bullet)
    
    -- wir möchten, dass das Spiel endet, falls ein Player-Character stirbt (ogott die Nomenklatur gerade ist furchtbar...)
    if player.isDead or enemy.isDead then
      gameRunning = false
    end
  end
end

function love.draw()

  debuggee.poll()
  
  -- die entities werden gezeichnet
  player:draw()
  enemy:draw()
  healthbarsnake:draw()
  healthbarpanda:draw()
  for i,v in ipairs(listOfBullets) do
    v:draw(dt)
  end

  -- die Anleitungen zur Steuerung werden gezeichnet
  love.graphics.draw(Settings.manualImagePanda, Settings.manualX, 5)
  love.graphics.draw(Settings.manualImageSnake, Settings.manualX, Settings.healthbarSnakeY)

  -- bei gameover wird der Gewinner ausgerufen und erwähnt, wie man das Spiel neustartet
  if gameRunning == false then
    if  player.isDead then
      paintWin(enemy)
    else
      paintWin(player)
    end
  end
  -- hier unten drunter kommt alles, was nur zum Entwickeln praktisch ist.
  love.graphics.print(Settings.WindowWidth, 10, 50)
  love.graphics.print(Settings.WindowHeight, 10, 65)
  love.graphics.print(tostring(love.timer.getFPS()), 100, 200)

end

function paintWin (character)
  Settings:pushfont(Settings.WinFont)
    --local f = love.graphics.getFont()
  -- love.graphics.setFont(Settings.WinFont)
    love.graphics.printf("Gratz, the " .. character.name .." has won! Please press 'r' to restart.",Settings.WindowWidth/6, (Settings.WindowHeight/2)-10, (Settings.WindowWidth/3)*2, "center")
    Settings:popfont()

    --love.graphics.printf("this should be a different font.",Settings.WindowWidth/6, (Settings.WindowHeight/2)+ 100, (Settings.WindowWidth/3)*2, "center")
   --love.graphics.setFont(f)
end




--workaround for linter
