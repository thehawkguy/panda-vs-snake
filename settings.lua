SettingsClass = Object:extend()
require "stackholder"

function SettingsClass:new()

    self.WindowWidth, self.WindowHeight = love.graphics.getDimensions()
    self.BulletImage = love.graphics.newImage("bullet.png")
    self.BulletWidth = self.BulletImage:getWidth()
    self.BulletHOffset = - (self.BulletWidth / 2)
    self.BulletHeight = self.BulletImage:getHeight()
    self.SnakeImage = love.graphics.newImage("snake.png")
    self.SnakeHeight = self.SnakeImage:getHeight()
    self.SnakeWidth = self.SnakeImage:getWidth()
    self.PandaImage = love.graphics.newImage("panda.png")
    self.PandaHeight = self.PandaImage:getHeight()
    self.PandaWidth = self.PandaImage:getWidth()
    self.pandaX = (self.WindowWidth / 2) - (self.PandaWidth / 2)
    self.snakeX = (self.WindowWidth / 2) - (self.SnakeWidth / 2)
    self.snakeY = self.WindowHeight - self.SnakeHeight - 45
    self.healthbarSnakeY = self.WindowHeight - 40
    self.manualX = self.WindowWidth / 2 - 100
    self.manualImagePanda = love.graphics.newImage("manualpanda.png")
    self.manualImageSnake = love.graphics.newImage("manualsnake.png")
    self.healthbarWidth = 450
    self.xRand1 = 100
    self.xRand2 = self.WindowWidth - 200
    self.WinFont = love.graphics.newFont(24)
    self.FontStack = FontStack()
    self.ColorStack = ColorStack()
    self.pUpImage = love.graphics.newImage("element_blue_polygon.png")
    self.pUpHeight = self.pUpImage:getHeight()
    self.pUpWidth = self.pUpImage:getWidth()
    self.pandaSpeed = 500
    self.snakeSpeed = 500

    oldWindowHeight = self.WindowHeight
    oldWindowWidth = self.WindowWidth

    ratio = 1

end

Settings = SettingsClass()

function SettingsClass:update()
    self.WindowWidth, self.WindowHeight = love.graphics.getDimensions()

    if oldWindowHeight ~= self.WindowHeight then

        ratioY = self.WindowHeight / oldWindowHeight

        self.snakeY = self.WindowHeight - self.SnakeHeight - 45
        self.healthbarSnakeY = self.WindowHeight - 40
        enemy.y = self.snakeY
        healthbarsnake.y = self.healthbarSnakeY

        for i,v in ipairs(listOfPUps) do
            v.y = v.y * ratioY
        end

        oldWindowHeight = self.WindowHeight
    end

    if oldWindowWidth ~= self.WindowWidth then

        ratioX = self.WindowWidth / oldWindowWidth

        enemy.x = enemy.x * ratioX
        player.x = player.x * ratioX
        self.manualX = self.manualX * ratioX

        self.healthbarWidth = self.healthbarWidth * ratioX

        for i,v in ipairs(listOfPUps) do
            v.x = v.x * ratioX
        end

        for i,v in ipairs(listOfBullets) do
            v.x = v.x * ratioX
        end

        oldWindowWidth = self.WindowWidth

    end
  end

  function SettingsClass:pushfont(font)
      self.FontStack:push(font)
  end

  function SettingsClass:popfont()
      self.FontStack:pop()
  end

  function SettingsClass:pushcolor(r, g, b, a)
      self.ColorStack:push(r, g, b, a)
  end

  function SettingsClass:popcolor()
      self.ColorStack:pop()
  end
