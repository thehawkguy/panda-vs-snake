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
  require "powerup"
  -- Wir möchten eine Pause-Funktion haben, primär für das "Game Over"
  -- daher ein bool den wir eingangs auf true setzen
  gameRunning = true
  -- sämtliche entities (s. auch entity class) werden initialisiert
  joysticks = love.joystick.getJoysticks()
  player = Player(Settings.pandaX, 45, Settings.pandaSpeed, joysticks[1])
  enemy = Enemy(Settings.snakeX, 570, Settings.snakeSpeed, joysticks[2])
  healthbarpanda = HealthBar(5, player)
  healthbarsnake = HealthBar(Settings.healthbarSnakeY, enemy)
  listOfBullets = {}
  listOfPUps = {}


  timePUp = 0


end

function love.update(dt)

  -- Settings machen nur Hintergrundsachen. Beispielsweise für die Platzierung, daher müssen sie immer updaten
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

      for j,k in ipairs(listOfPUps) do
        v:checkCollisionPUp(listOfPUps[j])

        if k.isDead then
          table.remove(listOfPUps, j)
        end

      end

      if v.isDead then
        table.remove(listOfBullets, i)
      end

    end

    PowerUp:update(dt)
    -- wir möchten, dass das Spiel endet, falls ein Player-Character stirbt
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
  for i,v in ipairs(listOfPUps) do
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

  --entwicklerzeugs
  --panda
  love.graphics.print("Panda movement speed is " .. tostring(player.speed), 10, 240)
  love.graphics.print("Panda bullet speed is " .. tostring(player.bulletSpeed), 10, 260)
  love.graphics.print("Panda fire rate cap is " .. tostring(player.fireCap), 10, 280)
  --snake
  love.graphics.print("Snake movement speed is " .. tostring(enemy.speed), 10, 300)
  love.graphics.print("Snake bullet speed is " .. tostring(enemy.bulletSpeed), 10, 320)
  love.graphics.print("Snake fire rate cap is " .. tostring(enemy.fireCap), 10, 340)
  love.graphics.print("Controller count: " .. table.getn(joysticks), 10, 360)
  love.graphics.print(tostring(player.joystick), 10, 380)
  love.graphics.print(tostring(enemy.joystick), 10, 400)

end

function paintWin (character)

  Settings:pushfont(Settings.WinFont)

  love.graphics.printf("Gratz, the " .. character.name .." has won! Please press 'r' to restart.",
  Settings.WindowWidth/6, (Settings.WindowHeight/2)-10, (Settings.WindowWidth/3)*2, "center")

  Settings:popfont()

end
--workaround for linter
