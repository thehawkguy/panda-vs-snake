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
    self.bulletSpeedPanda = 700
    self.bulletSpeedSnake = 700

    oldWindowHeight = self.WindowHeight
    oldWindowWidth = self.WindowWidth

    ratio = 1

end

Settings = SettingsClass()

function SettingsClass:update()
    self.WindowWidth, self.WindowHeight = love.graphics.getDimensions()

    if oldWindowHeight ~= self.WindowHeight then
        self.snakeY = self.WindowHeight - self.SnakeHeight - 45
        self.healthbarSnakeY = self.WindowHeight - 40
        enemy.y = self.snakeY
        healthbarsnake.y = self.healthbarSnakeY

        oldWindowHeight = self.WindowHeight
    end

    if oldWindowWidth ~= self.WindowWidth then

        ratio = self.WindowWidth / oldWindowWidth

        enemy.x = enemy.x * ratio
        player.x = player.x * ratio
        self.manualX = self.manualX * ratio

        self.healthbarWidth = self.healthbarWidth * ratio

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
